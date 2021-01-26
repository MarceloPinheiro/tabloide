Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    root to: "admin/promotions#index"
    resources :promotions do
      post :promotion_product
    end
    resources :categories
    resources :products
  end

  namespace :home do
    resources :promotions, only: [:index, :show]
  end

  root :to => "home/promotions#index"
  
end
