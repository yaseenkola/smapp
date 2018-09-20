Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  
  get 'welcome', to: 'welcome#index'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  # get 'admission', to: 'students#index'
  
   resources :students do
    collection { post :import }
  end
  
  get 'students/import', to: 'students_imports#index'
  
  get "remove_all_students" => "students#remove_all"
  
  
end
