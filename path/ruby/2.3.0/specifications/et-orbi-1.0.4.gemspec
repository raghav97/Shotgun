# -*- encoding: utf-8 -*-
# stub: et-orbi 1.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "et-orbi"
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Mettraux"]
  s.date = "2017-05-09"
  s.description = "Time zones for fugit and rufus-scheduler. Urbi et Orbi."
  s.email = ["jmettraux+flor@gmail.com"]
  s.homepage = "http://github.com/floraison/et-orbi"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "time with zones"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tzinfo>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4"])
    else
      s.add_dependency(%q<tzinfo>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.4"])
    end
  else
    s.add_dependency(%q<tzinfo>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.4"])
  end
end
