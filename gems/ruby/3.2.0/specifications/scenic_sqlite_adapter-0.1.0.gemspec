# -*- encoding: utf-8 -*-
# stub: scenic_sqlite_adapter 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "scenic_sqlite_adapter".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["pdebelak".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-06-17"
  s.email = ["pdebelak@gmail.com".freeze]
  s.homepage = "https://github.com/pdebelak/scenic_sqlite_adapter".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Sqlite adapter for scenic gem".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
  s.add_development_dependency(%q<scenic>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.0.0"])
end
