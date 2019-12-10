Rails.application.routes.draw do
  resource :mautic, only: [] do
    collection do
      get 'authorize'
      get 'callback'
    end
  end
end
