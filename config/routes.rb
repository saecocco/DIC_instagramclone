Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
