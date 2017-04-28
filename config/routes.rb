Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'product#get_product'
  get '/rake_task/:id' => 'product#rake_task'
end
