# Routes for my API

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts # /api/v1/posts
    end
  end
end
