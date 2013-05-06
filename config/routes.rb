App::Application.routes.draw do


  devise_for :users

  #Contacts path
  get "contacts",       					:to => "contacts#index",           :as => :contacts
  get "contacts/new",   					:to => "contacts#new",             :as => :new_contact
  post "contacts/new",  					:to => "contacts#create",          :as => false
  get "contacts/:id/edit",  			:to => "contacts#edit",            :as => :edit_contact
  put "contacts/:id/edit",  			:to => "contacts#update",          :as => false
  delete "contacts/:id/destroy",  :to => "contacts#destroy", 	       :as => :destroy_contact
	get "contacts/info/:id", 				:to => "contacts#info",			       :as => :info_contact
	get "contacts/import", 					:to => "import_contact#new",		 :as => :import_contact
  post "contacts/import",         :to => "import_contact#create",    :as => :false

  root :to => "contacts#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end