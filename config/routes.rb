Rails.application.routes.draw do
  
  devise_for :users
  get 'categorys/create'

  get 'categorys/edit'

  get 'categorys/destroy'

  resources :comments, only: [:edit, :destroy, :update, :create]

  resources :comments do
    member do
      get :solution
      end
    end
 
  resources :blog_posts

  root 'blog_posts#index'

  get 'answered' => 'blog_posts#answerPosts'
  get 'unanswered' => 'blog_posts#unanswerPosts'

  get 'your_posts' => 'blog_posts#your_posts'

  get 'user_profile' => 'blog_posts#user_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
