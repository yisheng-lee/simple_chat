# frozen_string_literal: true

module SimpleChat
  class InstallGenerator < Rails::Generators::Base
    def create_initializer
      initializer "simple_chat.rb" do
        <<~RUBY
          # Initialize SimpleChat
          SimpleChat.configure do |config|
            # Set the user model that will be used for chat members and messages
            config.chat_user_model = 'User'
          end
        RUBY
      end
    end
  end
end