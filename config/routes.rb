# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :students, only: [] do
    member do
      post :follow
      delete :unfollow
    end
  end

  resources :teachers, only: [] do
    member do
      get :followed_students
    end
  end
end
