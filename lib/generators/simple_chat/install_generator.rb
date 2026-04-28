# frozen_string_literal: true

module SimpleChat
  class InstallGenerator < Rails::Generators::Base
    def create_initializer
      create_file "config/initializers/simple_chat.rb", "# Initialize SimpleChat\nSimpleChat.configure do |config|\nconfig.chat_user_model = 'User'\nend"
    end
  end
end