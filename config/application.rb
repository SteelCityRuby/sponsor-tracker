require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SponsorTracker
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    def local_settings
      @local_settings ||= begin
        settings = ActiveSupport::OrderedOptions.new
        yaml = "#{Rails.root}/config/local.yml"
        if File.exist?(yaml)
          require "erb"
          all_settings = YAML.load(ERB.new(IO.read(yaml)).result) || {}
          env_settings = all_settings[Rails.env]
          settings.merge!(env_settings.symbolize_keys) if env_settings
        end

        settings
      end
    end
  end
end
