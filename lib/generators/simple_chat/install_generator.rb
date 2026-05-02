# frozen_string_literal: true

module SimpleChat
  class InstallGenerator < Rails::Generators::Base
    def create_initializer
      initializer "simple_chat.rb" do
        <<~RUBY
          # Initialize SimpleChat
          SimpleChat.configure do |config|
            # Set the user model that will be used for chat members and messages
            # config.chat_user_model = 'User'

            # Set the method to get the current user in the controller
            # Defaults to :current_user (standard for Devise)
            # config.current_user_method = :current_user
          end
        RUBY
      end
    end
  end
end