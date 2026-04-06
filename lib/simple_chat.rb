require "simple_chat/version"
require "simple_chat/engine"
require 'simple_chat/configuration'

module SimpleChat
  class << self
    attr_writer :configuration

    # Access the configuration object
    def configuration
      @configuration ||= Configuration.new
    end

    # The block handler
    def configure
      yield(configuration)
    end
  end
end
