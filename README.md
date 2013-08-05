## New Relic Centralized Sidekiq monitoring Plugin

The New Relic Sidekiq Plugin enables monitoring of any number of Sidekiq instances, a library for processing background jobs, reporting the following data for a specified instance:

* Number of working workers
* Pending jobs number
* Total failed jobs number
* Number of workers
* Number of processed jobs

### Requirements

The Centralized Sidekiq monitoring Plugin for New Relic requires the following:

* A New Relic account. Signup for a free account at http://newrelic.com
* You need a host to install the plugin on that is able to poll the desired Redis server. That host also needs Ruby (tested with 1.8.7, 1.9.3), and support for rubygems.

### Instructions for running the Sidekiq agent

1. Install this gem from RubyGems:

    `sudo gem install newrelic_centralized_sidekiq_agent`

2. Install config, execute

    `sudo newrelic_centralized_sidekiq_agent install` - it will create `/etc/newrelic/newrelic_centralized_sidekiq_agent.yml` file for you.

3. Edit the `/etc/newrelic/newrelic_centralized_sidekiq_agent.yml` file generated in step 2.

    3.1. replace `YOUR_LICENSE_KEY_HERE` with your New Relic license key. Your license key can be found under Account Settings at https://rpm.newrelic.com, see https://newrelic.com/docs/subscriptions/license-key for more help.

    3.2. add the Redis connection settings: Use the same syntax as used in the sidekiq initializer.rb file. You can monitor any number of sidekiq instances. See the example file for setup.

4. Execute

    `newrelic_centralized_sidekiq_agent run`

5. Go back to the Plugins list and after a brief period you will see the Sidekiq Plugin listed in your New Relic account

## Support

Please use Github issues for support.


This project uses MIT-LICENSE.