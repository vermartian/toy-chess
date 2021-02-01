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
Rails.application.config.assets.precompile += %w( chess_board.js )
Rails.application.config.assets.precompile += %w( gameplay.js )
Rails.application.config.assets.precompile += %w( bb.svg )
Rails.application.config.assets.precompile += %w( bk.svg )
Rails.application.config.assets.precompile += %w( bn.svg )
Rails.application.config.assets.precompile += %w( bp.svg )
Rails.application.config.assets.precompile += %w( bq.svg )
Rails.application.config.assets.precompile += %w( br.svg )
Rails.application.config.assets.precompile += %w( wb.svg )
Rails.application.config.assets.precompile += %w( wk.svg )
Rails.application.config.assets.precompile += %w( wn.svg )
Rails.application.config.assets.precompile += %w( wp.svg )
Rails.application.config.assets.precompile += %w( wp.svg )
Rails.application.config.assets.precompile += %w( wq.svg )
Rails.application.config.assets.precompile += %w( wr.svg )
