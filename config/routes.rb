<<<<<<< HEAD
Rails.application.routes.draw do
  # Roles Management
  TheRoleManagementPanel::Routes.mixin(self)

  # Errors Routes
  match '/403', to: 'errors#forbidden', via: :all, as: :forbidden
  match '/404', to: 'errors#file_not_found', via: :all, as: :file_not_found
  match '/422', to: 'errors#unprocessable', via: :all, as: :unprocessable
  match '/500', to: 'errors#internal_server_error', via: :all, as: :internal_server_error

  # Locale Scope
  scope 'locale' do
    get 'change/:country' => 'localize#change', as: :locale_change
    get 'states_from/:country' => 'localize#states_from', as: :states_from
    get 'cities_from/:country/:state' => 'localize#cities_from', as: :cities_from
  end

  # DeviseUser sessions
  devise_for :users,
             controllers: {
                 unlocks: 'users/unlocks',
                 sessions: 'users/sessions',
                 passwords: 'users/passwords',
                 registrations: 'users/registrations',
                 confirmations: 'users/confirmations',
                 omniauth_callbacks: 'users/omniauth_callbacks'
             }

  scope "/admin" do
    resources :users
  end

  scope "/subjects" do
    resources :knowledge_areas
  end

  # Not Persistence actions
  get 'dashboard', to: 'dashboard#index', as: :dashboard

  # Resources (CRUDs)
  resources :schools
  resources :subjects do
    post 'sign' => 'subjects#sign'
  end
  resources :subscriptions

  # Root route
  root to: 'users#index'
=======
Rails.application.routes.draw do
  # Roles Management
  TheRoleManagementPanel::Routes.mixin(self)

  # Errors Routes
  match '/403', to: 'errors#forbidden', via: :all, as: :forbidden
  match '/404', to: 'errors#file_not_found', via: :all, as: :file_not_found
  match '/422', to: 'errors#unprocessable', via: :all, as: :unprocessable
  match '/500', to: 'errors#internal_server_error', via: :all, as: :internal_server_error

  # Locale Scope
  scope 'locale' do
    get 'change/:country' => 'localize#change', as: :locale_change
    get 'states_from/:country' => 'localize#states_from', as: :states_from
    get 'cities_from/:country/:state' => 'localize#cities_from', as: :cities_from
  end

  # DeviseUser sessions
  devise_for :users,
             controllers: {
                 unlocks: 'users/unlocks',
                 sessions: 'users/sessions',
                 passwords: 'users/passwords',
                 registrations: 'users/registrations',
                 confirmations: 'users/confirmations',
                 omniauth_callbacks: 'users/omniauth_callbacks'
             }

  scope "/admin" do
    resources :users
  end

  scope "/subjects" do
    resources :knowledge_areas
  end

  # Not Persistence actions
  get 'dashboard', to: 'dashboard#index', as: :dashboard

  # Resources (CRUDs)
  resources :schools
  resources :subjects do
    post 'sign' => 'subjects#sign'
  end
  resources :subscriptions

  # Root route
  root to: 'users#index'
>>>>>>> 34166a1067dc45e0339bcbf35c4f8978d91dd5f3
end