# -*- encoding: utf-8 -*-
# stub: sidekiq-scheduler 2.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "sidekiq-scheduler"
  s.version = "2.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Morton Jonuschat", "Moove-it"]
  s.date = "2017-05-29"
  s.description = "Light weight job scheduling extension for Sidekiq that adds support for queueinga jobs in a recurring way."
  s.email = ["sidekiq-scheduler@moove-it.com"]
  s.homepage = "https://moove-it.github.io/sidekiq-scheduler/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Light weight job scheduling extension for Sidekiq"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sidekiq>, [">= 3"])
      s.add_runtime_dependency(%q<redis>, ["~> 3"])
      s.add_runtime_dependency(%q<rufus-scheduler>, ["~> 3.2"])
      s.add_runtime_dependency(%q<tilt>, [">= 1.4.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<timecop>, ["~> 0"])
      s.add_development_dependency(%q<mocha>, ["~> 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mock_redis>, ["~> 0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0"])
      s.add_development_dependency(%q<byebug>, [">= 0"])
      s.add_development_dependency(%q<activejob>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
    else
      s.add_dependency(%q<sidekiq>, [">= 3"])
      s.add_dependency(%q<redis>, ["~> 3"])
      s.add_dependency(%q<rufus-scheduler>, ["~> 3.2"])
      s.add_dependency(%q<tilt>, [">= 1.4.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<timecop>, ["~> 0"])
      s.add_dependency(%q<mocha>, ["~> 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mock_redis>, ["~> 0"])
      s.add_dependency(%q<simplecov>, ["~> 0"])
      s.add_dependency(%q<byebug>, [">= 0"])
      s.add_dependency(%q<activejob>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
    end
  else
    s.add_dependency(%q<sidekiq>, [">= 3"])
    s.add_dependency(%q<redis>, ["~> 3"])
    s.add_dependency(%q<rufus-scheduler>, ["~> 3.2"])
    s.add_dependency(%q<tilt>, [">= 1.4.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<timecop>, ["~> 0"])
    s.add_dependency(%q<mocha>, ["~> 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mock_redis>, ["~> 0"])
    s.add_dependency(%q<simplecov>, ["~> 0"])
    s.add_dependency(%q<byebug>, [">= 0"])
    s.add_dependency(%q<activejob>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
  end
end
