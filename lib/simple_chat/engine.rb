require "turbo-rails"
require "solid_cable"
require "tailwindcss-rails"

module SimpleChat
  class Engine < ::Rails::Engine
    isolate_namespace SimpleChat

    initializer "simple_chat.assets" do |app|
      app.config.assets.precompile += %w( simple_chat/application.css )
    end
  end
end
