require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ClayScore
  class Application < Rails::Application

    config.generators do |g|
      g.fixture_replacement :machinist
    end

  end
end
