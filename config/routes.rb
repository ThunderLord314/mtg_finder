Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cards' => 'cards#index'
  root 'cards#index'

  get 'cards/:id', to: 'cards#show', id: /\d+/

  get 'about' => 'about#index'

  get 'artists/:id', to: 'artists#show', id: /\d+/ 

  get 'expansions/:id', to: 'expansions#show', id: /\d+/

  get 'search' => 'search#index'

  get 'advancedsearch' => 'advancedsearch#index'
end
