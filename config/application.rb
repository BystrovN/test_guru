require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = 'Europe/Moscow'
    config.i18n.default_locale = :ru
  end
end
