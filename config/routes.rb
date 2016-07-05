Rails.application.routes.draw do

  root :to => "welcome#index"
  devise_for :users
  resources :people
  resources :events
  resources :scodes
  resources :users

  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index"
  get "groups/close/:id" => "groups#close"
  #get "groups/filter" => "groups#filter"  
  #get "users" => "users#index"
  
  namespace :account do
    resources :groups
    resources :posts
  end

end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  #get "events" => "events#index"
  #match ':controller(/:action(/:id(.:format)))'
  #match ':controller(/:action(/:id(.:format)))', :via => [:get] 
  #match ':controller(/:action)', :via => [:get] 
  #match 'gallery_:id' => 'gallery#show', :via => [:get], :as => 'gallery_show'
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end