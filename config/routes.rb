Rails.application.routes.draw do
  get 'people', to:'people#index'
  get 'msgboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post 'hello', to: 'hello#index'
post 'hello/index'
get 'hello/index'
get 'hello', to:'hello#index'
get 'hello/other'
end
