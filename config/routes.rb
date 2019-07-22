Rails.application.routes.draw do
  resources :products
  root 'products#index'

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end
end
