# frozen_string_literal: true

require_relative "lib/taylors_scaffold/version"

Gem::Specification.new do |spec|
  spec.name = "taylors_scaffold"
  spec.version = TaylorsScaffold::VERSION
  spec.authors = ["Cassie"]
  spec.email = ["peter.wdj@gmail.com"]

  spec.summary = "Some boilerplate code that is useful across applications"
  spec.description = "Concerns that can be used across Rails applications, useful for avoiding rewriting boilerplate code"
  spec.homepage = "https://github.com/isitpj/taylors_scaffold"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/isitpj/taylors_scaffold/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 4.2'
  spec.add_development_dependency 'pg', '~> 1.2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug', '~> 3.9.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
