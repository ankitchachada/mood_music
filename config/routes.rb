Rails.application.routes.draw do
  resources :moods
  root 'moods#new'
end
