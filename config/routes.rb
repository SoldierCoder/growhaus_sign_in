Rails.application.routes.draw do
  scope '(:locale)', locale: /en|es/ do
    get 'login' => 'pages#login'
    get 'welcome' => 'pages#welcome'
    resources :users do
      collection do
        get 'admin_index' => 'users#admin_index'
      end
    end
  end

  get '/:locale' => 'pages#welcome'
end
