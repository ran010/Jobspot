Rails.application.routes.draw do
  resources :seeker_profiles
  resources :recuitor_profiles
  resources :job_posts
  resources :messages
  resources :apply_jobs, only: [:create]
  get 'posted_jobs', to: 'recuitor_profiles#posted_jobs', as: :posted_jobs
  get 'applied_seeker/:id', to: 'recuitor_profiles#applied_seeker', as: :applied_seeker
  get 'applied_jobs', to: 'seeker_profiles#applied_jobs', as: :applied_jobs

  scope module: 'api' do
    get 'search_seeker', to: 'seeker#search'
    get 'search_recuitor', to: 'recuitor#search'
  end
  devise_for :recuitors, path: 'recuitors',controllers: {registrations: 'recuitors/registrations'}

  devise_for :seekers, path: 'seekers',controllers: {registrations: 'seekers/registrations'}

  mount Ckeditor::Engine => '/ckeditor'

  root 'search_jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
