Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'websites#qr'

  get 'websites/qr', to: 'websites#qr'
  get 'websites/visit', to: 'websites#visit'
end
