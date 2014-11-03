Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
#  get 'welcome/index'
#  get 'bitcasa/api'
#  get 'top/index'

  # top page is top/index
  # root 'top#index'
  root 'welcome#index'
  match '/top', to: 'top#index', as: 'user_root', via: 'get'

  # API page is bitcasa/api
  # match '/api', to: 'bitcasa#api', via: 'get'
  #  match '/api/folders', to: 'bitcasa#getfolders', via: 'get'
  #  match '/api/file', to: 'bitcasa#getfiles', via: 'get'

  match '/api/folders', to: 'bitcasa#getfolders', via: 'get'
  match '/api/file', to: 'bitcasa#getfiles', via: 'get'

  # API page is bitcasa/api
  match '/api/bitcasa', to: 'bitcasa#api', via: 'get'
  match '/api/bitcasa/folder', to: 'bitcasa#getfolders', via: 'get'
  match '/api/bitcasa/file', to: 'bitcasa#getfiles', via: 'get'

  # API page is dropbox/api
  match '/api/dropbox', to: 'dropbox#index', via: 'get'
  match '/api/dropbox/folder', to: 'dropbox#getfolders', via: 'get'
  match '/api/dropbox/file', to: 'dropbox#getfiles', via: 'get'


  # API page for postgres
  match '/api', to: 'api#index', via: 'get'
  match '/api/root', to: 'api#get_root_info', via: 'get'
  match '/api/detail', to: 'api#get_object_info', via: 'get'


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
