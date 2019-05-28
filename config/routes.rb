Spree::Core::Engine.add_routes do
  # Add your extension routes here
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :suburbs
    resources :states do
      resources :suburbs
    end
  end

  resources :suburbs, only: [:index]

end
