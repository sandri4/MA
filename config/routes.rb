Rails.application.routes.draw do
  root "posts#index"
  mount Blog::API => '/'
end
