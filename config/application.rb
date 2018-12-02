# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApi
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %i[get post options delete head patch put],
                 expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.autoload_paths += Dir[
      Rails.root.join('app', 'serializers', '*'),
      Rails.root.join('app', 'forms', '*'),
    ]
  end
end
