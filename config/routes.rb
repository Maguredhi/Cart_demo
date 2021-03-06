Rails.application.routes.draw do
  root 'products#index'
  
  resources :products
  resources :orders 

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      get :checkout
    end
  end
end
