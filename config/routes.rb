Rails.application.routes.draw do
  resources :posts
  resources :comments, :except => [:index,:new]
  namespace 'api' do
    namespace 'v1' do
      get 'posts' , to: "posts_comm_api#index"
      get 'posts/:post_id/comments', to: 'posts_comm_api#comments'
      post 'posts/:post_id/comments', to: 'posts_comm_api#createComment'
      put  'posts/:post_id/comments/:comments_id', to: 'posts_comm_api#updateComment'
      delete  'posts/:post_id/comments/:comments_id', to: 'posts_comm_api#deleteComment'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
