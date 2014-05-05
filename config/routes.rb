Myapp::Application.routes.draw do
  resources :sharednovels
  get "pending_invites/new"
  get "pending_invites/show"
  get "pending_invites/:id/accept" => 'pending_invites#accept' , :as => :pending_invite_accept 
  get "todo" => 'todo#show'
  resources :profiles , only: [ :show , :edit , :new , :create , :update , :destroy ] 

  resources :locations

  resources :characters

  resources :scenes do
    collection do 
      post 'sort'
    end 
  end
 
  resources :novels
  
  #resources :scenes
  
#  resources :novels do
#    resources :scenes
#  end 

#  resources :users do
#    resources :novels
#  end
 
#  resources :novels do 
#    resources :locations
#  end
 
#  resources :novels do
#    resources :characters
#  end
  #http://stackoverflow.com/questions/19722822/route-issue-in-rails-4-about-match-keyword-working-in-rails-3
  get ':auth/:provider/callback' => 'sessions#create'
  post ':auth/:provider/callback' => 'sessions#create'
  get ':/signout' =>'sessions#destroy' , :as =>:signout 
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root to: 'home#index'
  
 
 # get 'scenes/new/novel_id' 
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
end
