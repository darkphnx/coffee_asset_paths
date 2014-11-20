require "coffee_asset_paths/version"
require 'action_view/helpers/asset_url_helper'

module CoffeeAssetPaths
  
  module Rails
    class Engine < ::Rails::Engine
    end
  end

  class << self
    include ActionView::Helpers::AssetUrlHelper

    def asset_types
      ASSET_PUBLIC_DIRECTORIES.keys.to_json
    end

    def assets
      @assets ||= begin
        assets = {}

        ASSET_PUBLIC_DIRECTORIES.each do |type, path|
          asset_dir = File.join(::Rails.root, 'app', 'assets', path)
          next unless File.directory?(asset_dir)

          Dir.chdir(asset_dir) do
            assets[type] = Dir["**"].inject({}) {|h,f| h.merge! f => asset_path(f)}
          end
        end

        assets.to_json
      end
    end
  end

end
