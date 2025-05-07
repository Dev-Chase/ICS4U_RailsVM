# -*- encoding: utf-8 -*-
# stub: litestream 0.10.5 ruby lib

Gem::Specification.new do |s|
  s.name = "litestream".freeze
  s.version = "0.10.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/fractaledmind/litestream-ruby/CHANGELOG.md", "homepage_uri" => "https://github.com/fractaledmind/litestream-ruby", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/fractaledmind/litestream-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stephen Margheim".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-08-19"
  s.email = ["stephen.margheim@gmail.com".freeze]
  s.executables = ["litestream".freeze]
  s.files = ["exe/litestream".freeze]
  s.homepage = "https://github.com/fractaledmind/litestream-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Integrate Litestream with the RubyGems infrastructure.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<logfmt>.freeze, [">= 0.0.10"])
  s.add_runtime_dependency(%q<sqlite3>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubyzip>.freeze, [">= 0"])
  s.add_development_dependency(%q<rails>.freeze, [">= 0"])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
end
