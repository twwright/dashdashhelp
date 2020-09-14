Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "homes#show"
  end
  
  resources :questions, except: [:index] do
    resource :answers, except: [:index]
  end

  resources :answers do
    member do
      post "upvote" => "upvotes#create", as: :upvote
      delete "unvote" => "upvotes#destroy", as: :unvote
    end
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/unanswered" => "dashboards#unanswered", as: "unanswered"
end
