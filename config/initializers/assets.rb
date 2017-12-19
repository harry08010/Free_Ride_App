# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# welcome pages
Rails.application.config.assets.precompile += %w( welcome.js welcome.css )
# users pages
Rails.application.config.assets.precompile += %w( users/users.js users/users.css )
Rails.application.config.assets.precompile += %w( users/new.js users/new.css )
Rails.application.config.assets.precompile += %w( users/show.css)

#ride_posts pages
Rails.application.config.assets.precompile += %w( ride_posts/ride_post.css)
Rails.application.config.assets.precompile += %w( ride_posts/ride_post_search.css)

# global record
Rails.application.config.assets.included_js = []
Rails.application.config.assets.included_css = []

#map and autocomplete
Rails.application.config.assets.precompile += %w( map_autocomplete/map_autocomplete.js )
Rails.application.config.assets.precompile += %w( map_autocomplete/map_autocomplete.css )

#conversation
Rails.application.config.assets.precompile += %w( messages/vue.min.js )
Rails.application.config.assets.precompile += %w( messages/messages.js messages/messages.css )
