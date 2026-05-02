# frozen_string_literal: true

# Usage in Rails application config/initializers/simple_chat.rb)
# SimpleChat.configure do |config|
#   config.chat_user_model = 'User'
# end
module SimpleChat
  class Configuration
    attr_accessor :chat_user_model, :current_user_method

    def initialize
      @chat_user_model = "User"
      @current_user_method = :current_user
    end
  end
end
