Rails.application.routes.draw do
  resources :question_templates
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
