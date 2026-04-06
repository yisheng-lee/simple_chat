# frozen_string_literal: true

# Usage in Rails application config/initializers/simple_chat.rb)
# SimpleChat.configure do |config|
#   config.chat_user_model = 'User'
# end
module SimpleChat
  class Configuration
    attr_accessor :chat_user_model

    def initialize
      @chat_user_model = "User"
    end
  end
end
