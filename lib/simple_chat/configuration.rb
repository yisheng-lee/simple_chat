# frozen_string_literal: true

module SimpleChat
  class Configuration
    attr_accessor :chat_user_model

    def initialize
      @chat_user_model = nil
    end
  end
end
