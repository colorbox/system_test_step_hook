# SystemTestStepHook

This gem allow you toset before/after hook in system test.

## Installation

Add this line to your application's Gemfile:

```
gem 'system_test_step_hook'
```

Install the gem and add to the application's Gemfile by executing:

    $ bundle add system_test_step_hook

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install system_test_step_hook

## Usage

Add before/after block in your system test.

```
SystemTestStepHook.before do
  puts 'before output'
end

SystemTestStepHook.after do
  puts 'after output'
end
```

These block execute on each line before and after in system test.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colorbox/system_test_step_hook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/colorbox/system_test_step_hook/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SystemTestStepHook project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/colorbox/system_test_step_hook/blob/master/CODE_OF_CONDUCT.md).
