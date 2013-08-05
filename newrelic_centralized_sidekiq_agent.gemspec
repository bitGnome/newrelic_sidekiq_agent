$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "newrelic_centralized_sidekiq_agent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "newrelic_centralized_sidekiq_agent"
  s.version     = NewrelicCentralizedSidekiqAgent::VERSION
  s.authors     = ["Brett Piatt"]
  s.email       = ["brett.piatt@gmail.com"]
  s.homepage    = "https://github.com/bitGnome/newrelic_centralized_sidekiq_agent"
  s.summary     = "Sidekiq plug-in for NewRelic monitoring."
  s.description = "Sidekiq plug-in for NewRelic monitoring. This gem can be configured to monitor mulitiple sidekiq insatances."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency('newrelic_plugin', "1.0.3")
  s.add_dependency('sidekiq', ">= 2.12.1")

end
