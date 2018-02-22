require 'apartment/elevators/subdomain'

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Omni
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.middleware.use Apartment::Elevators::Subdomain
    config.load_defaults 5.2

     config.to_prepare do
    Devise::SessionsController.layout "devise"
    Devise::RegistrationsController.layout "devise"
    Devise::ConfirmationsController.layout "devise"
    Devise::UnlocksController.layout "devise"
    Devise::PasswordsController.layout "devise"
  end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
