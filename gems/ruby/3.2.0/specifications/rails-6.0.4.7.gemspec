# -*- encoding: utf-8 -*-
# stub: rails 6.0.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "rails".freeze
  s.version = "6.0.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.11".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rails/rails/issues", "changelog_uri" => "https://github.com/rails/rails/releases/tag/v6.0.4.7", "documentation_uri" => "https://api.rubyonrails.org/v6.0.4.7/", "mailing_list_uri" => "https://discuss.rubyonrails.org/c/rubyonrails-talk", "source_code_uri" => "https://github.com/rails/rails/tree/v6.0.4.7" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2022-03-08"
  s.description = "Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity. It encourages beautiful code by favoring convention over configuration.".freeze
  s.email = "david@loudthinking.com".freeze
  s.homepage = "https://rubyonrails.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Full-stack web application framework.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<activesupport>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actionpack>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actionview>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<activemodel>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<activerecord>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actionmailer>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<activejob>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actioncable>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<activestorage>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actionmailbox>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<actiontext>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<railties>.freeze, ["= 6.0.4.7"])
  s.add_runtime_dependency(%q<bundler>.freeze, [">= 1.3.0"])
  s.add_runtime_dependency(%q<sprockets-rails>.freeze, [">= 2.0.0"])
end
