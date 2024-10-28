Rails.application.routes.draw do
  # get 'document_summarizer/index'
  # get 'plagiarism_checker/index'
  # get 'bibliography_writer/index'
  # get 'profile/show'
  # get 'dashboard/index'
  # root to: "pages#home"
    root to: 'dashboard#index'

    get 'dashboard', to: 'dashboard#index'
    get 'profile', to: 'profile#show'
    get 'bibliography_writer', to: 'bibliography_writer#index'
    get 'plagiarism_checker', to: 'plagiarism_checker#index'
    get 'document_summarizer', to: 'document_summarizer#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
