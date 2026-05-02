module SimpleChat
  class ApplicationController < ::ApplicationController
    helper_method :simple_chat_current_user

    def simple_chat_current_user
      method = SimpleChat.configuration.current_user_method
      if respond_to?(method, true)
        send(method)
      elsif defined?(Current) && Current.respond_to?(:user)
        Current.user
      else
        nil
      end
    end
  end
end
