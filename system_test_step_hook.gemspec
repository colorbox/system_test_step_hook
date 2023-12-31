# frozen_string_literal: true

require_relative "lib/system_test_step_hook/version"

Gem::Specification.new do |spec|
  spec.name = "system_test_step_hook"
  spec.version = SystemTestStepHook::VERSION
  spec.authors = ["colorbox"]
  spec.email = ["colorbox222@gmail.com"]

  spec.summary = 'You can add a before/after hook in a system test for each line'
  spec.description = 'You can add a step hook like a turnip for system test'
  spec.homepage = 'https://github.com/colorbox/system_test_step_hook'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/colorbox/system_test_step_hook"
  spec.metadata['changelog_uri'] = 'https://github.com/colorbox/system_test_step_hook/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'parser'
  spec.add_runtime_dependency 'unparser'
  spec.add_runtime_dependency 'method_source'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
