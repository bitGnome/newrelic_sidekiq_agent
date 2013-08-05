#! /usr/bin/env ruby

#
# This plugin to monitor sidekiq.
#

require "rubygems"
require "bundler/setup"
require 'debugger'
require 'sidekiq'
require "newrelic_plugin"

module CentralizedSidekiqAgent

  VERSION = '1.0.1'

  class Agent < NewRelic::Plugin::Agent::Base

    agent_guid "com.betterdoctor.centralized.sidekiq"
    agent_version "1.0.1"
    agent_config_options :host, :namespace
    agent_human_labels("Sidekiq") { "Sidekiq on #{host}_#{namespace}" }


    def setup_metrics
      @total_failed = NewRelic::Processor::EpochCounter.new
      @processed    = NewRelic::Processor::EpochCounter.new
    end

    def poll_cycle
      if (host != nil || namespace != nil)
        raise ArgumentError, "You must supply a host and namespace in the newrelic_plugin.yml!"
      end

      begin
        Sidekiq.redis = { :url => "redis://#{host}", :namespace => namespace  }
        stats = Sidekiq::Stats.new

        report_metric "Workers/Working", "Workers", Sidekiq::Workers.new.size
        report_metric "Jobs/Pending", "Jobs", stats.enqueued
        report_metric "Jobs/Failed", "Jobs", stats.failed
        report_metric "Jobs/Processed", "Jobs", stats.processed
        report_metric "Jobs/Rate/Processed", "Jobs/Second", @processed.process(stats.processed)
        report_metric "Jobs/Rate/Failed", "Jobs/Second", @total_failed.process(stats.failed)

      end

    end

  end

  # Register and run the agent.
  def self.run
    NewRelic::Plugin::Config.config.agents.keys.each do |agent|
      if agent =~ /sidekiq/
        NewRelic::Plugin::Setup.install_agent agent, CentralizedSidekiqAgent
      end
    end


    #
    # Launch the agent; this never returns.
    #
    NewRelic::Plugin::Run.setup_and_run

  end

  CentralizedSidekiqAgent.run

end
