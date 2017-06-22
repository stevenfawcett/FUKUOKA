require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrelloAPI
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths += Dir["#{config.root}/lib/"]
    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "config"  )

    config.base_title = 'Fukuoka'
    config.sub_title  = 'The Incident Gateway'
  end
end
