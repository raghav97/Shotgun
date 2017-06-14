# -*- encoding: utf-8 -*-
# stub: rufus-scheduler 3.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rufus-scheduler"
  s.version = "3.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Mettraux"]
  s.date = "2017-05-24"
  s.description = "Job scheduler for Ruby (at, cron, in and every jobs). Not a replacement for crond."
  s.email = ["jmettraux@gmail.com"]
  s.homepage = "http://github.com/jmettraux/rufus-scheduler"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubyforge_project = "rufus"
  s.rubygems_version = "2.5.1"
  s.summary = "job scheduler for Ruby (at, cron, in and every jobs)"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<et-orbi>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4"])
      s.add_development_dependency(%q<chronic>, [">= 0"])
    else
      s.add_dependency(%q<et-orbi>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, ["~> 3.4"])
      s.add_dependency(%q<chronic>, [">= 0"])
    end
  else
    s.add_dependency(%q<et-orbi>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, ["~> 3.4"])
    s.add_dependency(%q<chronic>, [">= 0"])
  end
end
