# Rails.application.routes.draw do
#   devise_for :users
#   # get 'document_summarizer/index'
#   # get 'plagiarism_checker/index'
#   # get 'bibliography_writer/index'
#   # get 'profile/show'
#   # get 'dashboard/index'
#   # root to: "pages#home"
#     root to: 'dashboard#index'

#     get 'dashboard', to: 'dashboard#index'
#     get 'profile', to: 'profile#show'
#     get 'plagiarism_checker', to: 'plagiarism_checker#index'
#     get 'document_summarizer', to: 'document_summarizer#index'

#     resources :bibliography_writers, only: [:new, :create, :show, :index]
#     resources :document_summarizer, only: [:index, :create]
#     post 'plagiarism_check', to: 'plagiarism_checker#check'

#     post 'webhook/status', to: 'webhooks#status'
#     post 'webhook/completion', to: 'webhooks#completion'

#     resources :plagiarism_checker, only: [:index] do
#       collection do
#         post :check
#       end
#     end



#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end


Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'
  get 'profile', to: 'profile#show'
  get 'plagiarism_checker', to: 'plagiarism_checker#index'

  resources :bibliography_writers, only: [:new, :create, :show, :index]
  resources :document_summarizer, only: [:index, :create]

  # Define the check action for plagiarism_checker
  post 'plagiarism_checker/check', to: 'plagiarism_checker#check', as: :plagiarism_checker_check

  post 'webhook/status', to: 'webhooks#status'
  post 'webhook/completion', to: 'webhooks#completion'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
