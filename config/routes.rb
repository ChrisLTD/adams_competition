AdamsCompetition::Application.routes.draw do
  resources :profiles, :except => [:index, :destroy, :new]

  resources :settings

  resources :pages
  
  match 'page/:slug' => 'pages#show_slug', :as => 'show_slug'

  devise_for :users
	
	match 'admin/users/' => 'admin#user_list', :as => 'user_list'

	match 'admin/files/' => 'admin#file_list', :as => 'file_list'
	
	match 'redirect' => 'profiles#redirect', :as => 'profile_edit'
	
	match 'user' => 'profiles#redirect', :as => 'profile_edit'
	
	namespace :user do
    root :to => 'profiles#redirect'
	end
	
	resources :users, :only => [:destroy]
	
	match 'users/:id/toggle_admin' => 'users#toggle_admin', :as => :toggle_admin
	
	match 'rules' => 'pages#show_slug', :slug => "rules", :as => 'rules'
	
	match 'sorry' => 'pages#show_slug', :slug => "permission-error", :as => 'permission_error'
	
	root :to => 'pages#show_slug', :slug => "home"

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
  
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
