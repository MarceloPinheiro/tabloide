Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    root to: "promotions#index"
    resources :promotions do
      post :promotion_product
      delete :promotion_product_destroy
    end
    resources :categories
    resources :products
  end

  namespace :home do
    resources :promotions, only: [:index, :show]
  end

  root :to => "home/promotions#index"
  
end
