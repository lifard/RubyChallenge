Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'news#index'

  put '/update_liked_status/:liked_status/:id' => 'news#update_like_status'
end
