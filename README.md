<p align="center">
    <a href="https://rubocop.org"  target="_blank" rel="noopener">
      <img width="120px" src="https://github.com/rubocop-semver/rubocop-ruby3_1/raw/main/docs/images/logo/rubocop-logo.svg?raw=true" alt="Rubocop Logo, Copyright (c) 2014 Bozhidar Batsov, MIT License">
    </a>
    <a href="https://www.ruby-lang.org/" target="_blank" rel="noopener">
      <img width="120px" src="https://github.com/rubocop-semver/rubocop-ruby3_1/raw/main/docs/images/logo/ruby-logo.svg?raw=true" alt="Yukihiro Matsumoto, Ruby Visual Identity Team, CC BY-SA 2.5">
    </a>
    <a href="https://semver.org/" target="_blank" rel="noopener">
      <img width="120px" src="https://github.com/rubocop-semver/rubocop-ruby3_1/raw/main/docs/images/logo/semver-logo.svg?raw=true" alt="SemVer.org Logo by @maxhaz">
    </a>
</p>

# Rubocop::Ruby31

See the intro [blog post](https://dev.to/pboling/rubocop-ruby-matrix-gems-nj)!

This gem requires no other gems.  It depends on `rubocop`, but does not `require 'rubocop'`.  The purpose of this gem is to constrain the `rubocop` dependency of a project in a [SemVer compliant](https://semver.org/) (Semantic Versioning) way that aligns with the the desired minimum compatible/supported Ruby version.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rubocop-ruby3_1 -r false

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rubocop-ruby3_1

## Usage

The following is optional.  We'll discuss why you might want to do this after you see what it does.

Add to the top of your project's RuboCop configuration file:

```yaml
inherit_gem:
  rubocop-ruby3_1: rubocop.yml
```

This has the same effect as you declaring the following in your `.rubocop.yml`, and note that if you do have this in your's you should remove it to gain the full benefit of this gem:

```yaml
AllCops:
  TargetRubyVersion: 3.1
  NewCops: enable
```

Let's talk about these settings.

## TargetRubyVersion

Allowing this gem to manage the target ruby version means you can switch to a different gem within the family when you upgrade to the next version of Ruby, and have nothing else to change.  A single line in the `Gemfile`, and you are done.

## NewCops: enable

You may not use this setting in your project yet.  Upgrades to the latest Rubocop can include all kinds of changes, including removing support for the version of Ruby your project uses, or adding a cop that may not work with some of your syntax (e.g. [some use cases of 'module_function`](https://github.com/rubocop/rubocop/issues/5953#issuecomment-805921993)).  Accepting new cops arriving in a new version of Rubocop can feel risky, especially when it doesn't follow SemVer.

But this gem shoehorns rubocop into SemVer... so `NewCops` is now safe(r)!  If you use a dependency greening tool like GitHub's `dependabot`, or the excellent alternatives [depfu](https://depfu.com/), and [`renovate`](https://www.whitesourcesoftware.com/free-developer-tools/renovate/), then you can see the effect of a minor / major version bumpin your CI Build!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

See [CONTRIBUTING.md][contributing]

## Contributors

[![Contributors](https://contrib.rocks/image?repo=rubocop-semver/rubocop-ruby3_1)]("https://github.com/rubocop-semver/rubocop-ruby3_1/graphs/contributors")

Made with [contributors-img](https://contrib.rocks).

## License

The gem is available as open source under the terms of
the [MIT License][license] [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)][license-ref].
See [LICENSE][license] for the official [Copyright Notice][copyright-notice-explainer].

* Copyright (c) 2022 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year

## Code of Conduct

Everyone interacting in the Rubocop::Ruby31 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rubocop-semver/rubocop-ruby3_1/blob/main/CODE_OF_CONDUCT.md).

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations of this scheme should be reported as
bugs. Specifically, if a minor or patch version is released that breaks backward compatibility, a new version should be
immediately released that restores compatibility. Breaking changes to the public API will only be introduced with new
major versions.

As a result of this policy, you can (and should) specify a dependency on this gem using
the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency "rubocop-ruby3_1", "~> 0.1"
```

[copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year

[gh_discussions]: https://github.com/rubocop-semver/rubocop-ruby3_1/discussions

[conduct]: https://github.com/rubocop-semver/rubocop-ruby3_1/blob/main/CODE_OF_CONDUCT.md

[contributing]: https://github.com/rubocop-semver/rubocop-ruby3_1/blob/main/CONTRIBUTING.md

[security]: https://github.com/rubocop-semver/rubocop-ruby3_1/blob/main/SECURITY.md

[license]: https://github.com/rubocop-semver/rubocop-ruby3_1/blob/main/LICENSE.txt

[license-ref]: https://opensource.org/licenses/MIT

[semver]: http://semver.org/

[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint

[railsbling]: http://www.railsbling.com

[peterboling]: http://www.peterboling.com

[aboutme]: https://about.me/peter.boling

[angelme]: https://angel.co/peter-boling

[coderme]:http://coderwall.com/pboling

[followme-img]: https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow

[tweetme]: http://twitter.com/galtzo

[politicme]: https://nationalprogressiveparty.org

[documentation]: https://rubydoc.info/github/rubocop-semver/rubocop-ruby3_1/main

[source]: https://github.com/rubocop-semver/rubocop-ruby3_1/

[actions]: https://github.com/rubocop-semver/rubocop-ruby3_1/actions

[issues]: https://github.com/rubocop-semver/rubocop-ruby3_1/issues

[climate_maintainability]: https://codeclimate.com/github/rubocop-semver/rubocop-ruby3_1/maintainability

[climate_coverage]: https://codeclimate.com/github/rubocop-semver/rubocop-ruby3_1/test_coverage

[codecov_coverage]: https://codecov.io/gh/rubocop-semver/rubocop-ruby3_1

[code_triage]: https://www.codetriage.com/rubocop-semver/rubocop-ruby3_1

[blogpage]: http://www.railsbling.com/tags/rubocop-ruby3_1/

[rubygems]: https://rubygems.org/gems/rubocop-ruby3_1

[chat]: https://gitter.im/rubocop-semver/rubocop-ruby3_1?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[maintenancee_policy]: https://guides.rubyonrails.org/maintenance_policy.html#security-issues

[liberapay_donate]: https://liberapay.com/pboling/donate

[gh_sponsors]: https://github.com/sponsors/pboling