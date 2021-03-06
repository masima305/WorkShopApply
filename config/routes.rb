Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/regi' => "devise/sessions#new"
  get 'users/sign_out' => "devise/sessions#destroy"
  get 'admin/index' => "admin#adindex"
  get 'admin/userlist/:num' => "admin#userset"
  get 'admin/classlist' => "admin#subjectset"
  get 'admin/onoff' => "admin#onoff"
  get 'admin/pushbutton' => "admin#pushbutton"
  get 'home/quit/:clanum' => "home#quit"
  post 'admin/classmake' => "admin#createsubject"
  post 'admin/classupdate'  => "admin#updatesubject"
  get 'admin/classdestroy/:id' => "admin#destroysubject"
  get 'home/enrollone/:id' => "home#enrollone"
  get 'home/enrolltwo/:id' => "home#enrolltwo"
  get 'home/stat' => "home#registerstat"
  get 'home/error/:num' => "home#error"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
