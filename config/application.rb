require File.expand_path("../boot", __FILE__)

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module DesafioProgramacao1b
  class Application < Rails::Application
    config.time_zone = "Brasilia"

    config.i18n.available_locales = %i(pt-BR en)
    config.i18n.default_locale = :"pt-BR"

    config.active_record.raise_in_transactional_callbacks = true
  end
end
