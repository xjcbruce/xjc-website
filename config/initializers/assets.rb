# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "flatui", "dist")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "bootstrap-select")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "buttons")

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Rails.application.config.assets.precompile += %w( dist/css/flat-ui.css )
Rails.application.config.assets.precompile += %w( css/bootstrap-select.css )
Rails.application.config.assets.precompile += %w( css/buttons.css )
Rails.application.config.assets.precompile += %w( welcome.js order.js )
