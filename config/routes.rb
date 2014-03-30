ClayScore::Application.routes.draw do
  resources :sports do
    resources :leagues
  end
end
