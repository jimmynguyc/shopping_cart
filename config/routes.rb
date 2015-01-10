Rails.application.routes.draw do
  resources :sales
  resources :products

  devise_for :admins, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  authenticate :admin do
    mount Upmin::Engine => '/admin'
  end

  root 'products#index'
end
