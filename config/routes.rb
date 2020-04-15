Rails.application.routes.draw do
  get 'start/index'
  get 'root/index'
  get 'surveys/index'
  post 'surveys/start'
  get 'surveys/start'
  get 'surveys/question'
  post 'surveys/question'
  post 'surveys/answer'
  get 'surveys/answer'
  get 'surveys/end'

  root 'start#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
