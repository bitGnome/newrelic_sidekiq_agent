$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "newrelic_sidekiq_agent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "newrelic_sidekiq_agent"
  s.version     = NewrelicSidekiqAgent::VERSION
  s.authors     = ["Brett Piatt"]
  s.email       = ["brett.piatt@gmail.com"]
  s.homepage    = "http://"
  s.summary     = "TODO: Summary of NewrelicSidekiqAgent."
  s.description = "TODO: Description of NewrelicSidekiqAgent."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
