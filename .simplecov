# frozen_string_literal: true

# To get coverage
# On Local, default (HTML) output coverage is turned on with Ruby 3.1+:
#   bundle exec rspec spec
# On Local, all output formats with Ruby 3.1+:
#   COVER_ALL=true bundle exec rspec spec
#
# On CI, all output formats, the ENV variables CI is always set,
#   and COVER_ALL, and CI_CODECOV, are set in the coverage.yml workflow only,
#   so coverage only runs in that workflow, and outputs all formats.
#

if RUN_COVERAGE
  SimpleCov.start do
    enable_coverage :branch
    primary_coverage :branch
    add_filter "spec"
    # Why exclude version.rb? See: https://github.com/simplecov-ruby/simplecov/issues/557#issuecomment-410105995
    add_filter "lib/rubocop/ruby3_1/version.rb"
    track_files "**/*.rb"

    if ALL_FORMATTERS
      command_name "#{ENV.fetch("GITHUB_WORKFLOW", nil)} Job #{ENV.fetch("GITHUB_RUN_ID", nil)}:#{ENV.fetch("GITHUB_RUN_NUMBER", nil)}"
    else
      formatter SimpleCov::Formatter::HTMLFormatter
    end

    minimum_coverage(line: 70, branch: 70)
  end
else
  puts "Not running coverage on #{RUBY_VERSION}-#{RUBY_ENGINE}"
end
