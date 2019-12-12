Rails.application.routes.draw do
  resource :mautic, only: [] do
    collection do
      get 'authorize'
      get 'callback'
    end
  end

  namespace :api do
    namespace :reports do
      get 'sectors', to: 'reports#sectors'
      get 'leaderboard', to: 'reports#leaderboard'
    end
  end
end
