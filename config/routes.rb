SimpleChat::Engine.routes.draw do
  root to: "chat_rooms#index"
  resources :chat_rooms do
    resources :chat_members, only: [:create, :destroy]
  end
  resources :messages
end
