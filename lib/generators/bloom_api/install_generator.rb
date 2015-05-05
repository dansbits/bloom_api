require 'rails/generators/base'

module BloomApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BloomApi initializer for your application."

      def copy_initializer
        template "bloom_api.rb", "config/initializers/bloom_api.rb"
      end

    end
  end
end
