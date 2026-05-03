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

    def create_chat(*users, title: nil)
      users = users.flatten.compact
      if title.nil?
        names = users.map { |u| u.respond_to?(:name) ? u.name : u.id }
        if names.size > 2
          title = "Chat between #{names[0...-1].join(", ")} and #{names.last}"
        elsif names.size == 2
          title = "Chat between #{names.first} and #{names.last}"
        elsif names.size == 1
          title = "Chat for #{names.first}"
        else
          title = "Empty Chat"
        end
      end

      ChatRoom.transaction do
        chat_room = ChatRoom.create!(title: title)
        users.each { |user| chat_room.chat_members.create!(user: user) }

        chat_room
      end
    end
  end
end
