require "turbo-rails"
require "solid_cable"

module SimpleChat
  class Engine < ::Rails::Engine
    isolate_namespace SimpleChat
  end
end
