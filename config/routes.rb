Wimap::Application.routes.draw do
  get "navpoints/index"
  get "navpoints/show"
  get "navpoints/new"
  get "navpoints/edit"
  get "navpoints/create"
  get "navpoints/update"
  get "navpoints/destroy"
  get "navpoints/destroy_all"
  get "distancesamples/index"
  get "distancesamples/show"
  get "distancesamples/new"
  get "distancesamples/edit"
  get "distancesamples/create"
  get "distancesamples/udpate"
  get "distancesamples/destroy"
  get "distancesamples/destroy_all"
  get "auth/index"
  get "auth/show"
  get "auth/new"
  get "auth/edit"
  get "auth/create"
  get "auth/update"
  get "auth/destroy"
  get "auth/destroy_all"
  get "messages/index"
  get "messages/show"
  get "messages/new"
  get "messages/edit"
  get "messages/create"
  get "messages/update"
  get "messages/destroy"
  get "messages/destroy_all"
  get "distance_samples/index"
  get "distance_samples/new"
  get "distance_samples/destroy"
  resources :sites

  resources :routers do
    collection do
      get 'destroy_all'
    end
  end

  resources :tracks

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'visitors#new'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :routers, :only => [:index, :create]
      resources :tracks,  :only => [:index, :create]
      resources :sites, :only => [:index, :create]
      resources :distance_samples, :only => [:index, :create]
      get 'sites/:site/routers' => 'sites#routers', as: :site
      get 'routers/:router/samples' => 'routers#samples', as: :router
    end # <-- v1 -->
  end # <-- api -->

  resources :users, :only => [:show, :index]

  get "visitors/about"



  ######## EXAMPLES:
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
