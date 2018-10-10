Rails.application.routes.draw do
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  
  get 'welcome', to: 'welcome#index'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  # for seacrh in navbar
  post '/admissions' => 'students#index'
  
  # get 'admission', to: 'students#index'
  # get 'admissions/new', to: 'students#new', as: 'new'
  get 'admission/new', to: 'students#new'
  get 'admissions', to: 'students#index'

  resources :students, except: [:new, :index] do
    collection { post :import }
  end
  
  get 'admissions/import', to: 'student_imports#index'
  
  get "remove_all_students" => "students#remove_all"
  
  
  resources :search, only: [:index] do
    collection do
      post 'results'
    end
  end
  
  post '/results' => 'students#index'
  
  
end
