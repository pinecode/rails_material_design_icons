# frozen_string_literal: true

require File.expand_path('boot', __dir__)

# require "rails/all"
require 'sprockets/railtie'

Bundler.require(:default, :development)

module Dummy
  class Application < Rails::Application
    config.encoding = 'utf-8'
    config.assets.enabled = true
    config.assets.version = '1.0'

    # replacement for environments/*.rb
    config.active_support.deprecation = :stderr
    config.eager_load = false
    config.active_support.test_order = begin
      :random
    rescue StandardError
      nil
    end
  end
end
