SimpleChat::Engine.routes.draw do
  resources :messages
  root to: "chat_rooms#index"
  resources :chat_rooms
end
