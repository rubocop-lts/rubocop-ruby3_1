# frozen_string_literal: true

require "rake"

RSpec.describe Rubocop::Ruby31 do
  describe "install_tasks" do
    subject(:install_tasks) { described_class.install_tasks }

    it "loads rubocop/ruby3_1/tasks.rake" do
      block_is_expected.to not_raise_error &
        change {
          Rake.application.options.rakelib
        }.from(["rakelib"]).to(["rakelib", %r{rubocop/ruby3_1/rakelib}])
    end
  end
end
