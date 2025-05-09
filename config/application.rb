require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RestaurantApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config/application.rb または環境別設定ファイルで

    # config/application.rb の中または config/environments/production.rb / development.rb で
    Rails.application.config.css_build_command = "yarn run css:install"


    
    config.active_storage.variant_processor = :mini_magick
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
        # 日本語の言語設定。この一行を追加。
        config.i18n.default_locale = :ja

        config.generators do |g|
          g.test_framework :rspec,
            view_specs: false,
            helper_specs: false,
            routing_specs: false
        end   
  end
end
