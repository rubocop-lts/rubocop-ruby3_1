module Rubocop
  module Ruby31
    class Railtie < Rails::Railtie
      railtie_name :rubocop_ruby3_1

      if Rails.env.test? || Rails.env.development?
        rake_tasks do
          Rubocop::Ruby31.install_tasks
        end
      end
    end
  end
end
