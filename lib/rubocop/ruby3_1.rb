# frozen_string_literal: true

# external libs
require "version_gem"

# this gem
require_relative "ruby3_1/version"
# simplecov:disable
require_relative "ruby3_1/railtie" if defined?(Rails::Railtie)
# simplecov:enable

module Rubocop
  # Namespace of this library
  module Ruby31
    module_function def install_tasks
      load("rubocop/ruby3_1/tasks.rb")
    end
  end
end

Rubocop::Ruby31::Version.class_eval do
  extend VersionGem::Basic
end
