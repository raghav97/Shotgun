# -*- encoding: utf-8 -*-
# stub: flipkart_api 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "flipkart_api"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Deepak HB", "Girish Nair"]
  s.date = "2017-01-29"
  s.description = "Pull data from flipkart by using api"
  s.email = "deepakhb2@gmail.com"
  s.homepage = "https://github.com/deepakhb2/flipkart_api"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "This gem will help you to pull data from flipkart using flipkart api"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["= 1.7.2"])
    else
      s.add_dependency(%q<rest-client>, ["= 1.7.2"])
    end
  else
    s.add_dependency(%q<rest-client>, ["= 1.7.2"])
  end
end
