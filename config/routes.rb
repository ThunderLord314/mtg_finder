Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cards' => 'cards#index'
  get 'cards/:id', to: 'cards#show', id: /\d+/
end
