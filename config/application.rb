require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Notif
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
	# config.middleware.insert_before ActionDispatch::Cookies, "Rack::SSL"
	# config.web_console.whitelisted_ips = '90.127.90.128'
	config.force_ssl = true
	# config.ssl_options = { redirect: { exclude: -> request { request.path =~ /health-check/ } } }
	# Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
