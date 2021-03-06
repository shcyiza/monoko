Rails.application.routes.draw do
  resources :searches
  resources :skills
  get 'users/show'

  get 'users/index'

  get 'users/edit'

  resources :definition_translations
  resources :definition_groups
  resources :groups
  resources :definition_themes

  devise_for :users
  resources :users

  resources :exemples
  resources :illustrations
  resources :themes
  resources :definitions
  resources :words

  get "dico_fr" => "words#dico_fr"
  get "dico_li" => "words#dico_li"

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/team'
  get 'pages/terms'
  get 'admin' => "pages#admin"


  #admin page

  get 'admin_words' => 'pages#admin_words'
  get 'admin_definitions' => 'pages#admin_definitions'
  get 'admin_translations' => 'pages#admin_translations'
  get 'admin_definitions_themes' => 'pages#admin_definitions_themes'
  get 'admin_themes' => 'pages#admin_themes'
  get 'admin_definitions_groups' => 'pages#admin_definitions_groups'
  get 'admin_groups' => 'pages#admin_groups'
  get 'admin_searches' => 'pages#admin_searches'
  get 'export_words' => 'pages#export_words'
  get 'export_definiton' => 'pages#export_definition'
  get 'export_translation' => 'pages#export_translation'

  resources :words do
    collection do
      post :import
      post :import_updates
    end
  end

  resources :definitions do
    collection do
      post :import_updates
    end
  end

  resources :definition_translations do
    collection do
      post :import_updates
    end
  end
  # You can have the root of your site routed with "root"
  root 'pages#home'





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



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
