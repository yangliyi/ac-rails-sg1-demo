Rails.application.routes.draw do
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index"

  resources :events do
    resources :attendees, :controller => "event_attendees"

    collection do
      get :latest

      post :bulk_delete
      post :bulk_update
    end
  end

  root :to => "welcome#index"

end
