source 'http://rubygems.org'

# RoR components
gem 'rails', '~> 3.2.8'
gem 'mysql2'
gem 'devise'

# Hydra community components
gem 'blacklight'
gem 'hydra-head'

# FromThePage components
gem 'rmagick', :require => 'RMagick'
gem 'will_paginate'
gem 'hpricot'
gem 'oai'
gem 'capistrano'

# FtP dependencies that were Rails 2.3.x plugins
gem 'acts_as_list'
gem 'acts_as_tree'
gem 'in_place_editing'
gem 'simple_captcha'

gem "nokogiri"
# gem "geokit"

group :development, :test do
  gem 'sqlite3'
  gem 'unicorn-rails'
  gem 'debugger'
  gem 'jettywrapper'
end

group :production do
  gem 'passenger'
end

gem "compass-rails", "~> 1.0.0", :group => :assets
gem "compass-susy-plugin", "~> 0.9.0", :group => :assets