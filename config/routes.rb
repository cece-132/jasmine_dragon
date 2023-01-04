Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      post "/customer_subscription", to: 'customer_subscriptions#create'
      patch "/customer_subscription/:id", to: 'customer_subscriptions#update'
    end
  end

end
