class Blog::Posts < Grape::API
  namespace :posts do
    get do
      post = User.find(params[:user_id]).posts.published
      present post, with: Blog::Entities::Post
    end
    params do
      requires :title, type: String
      requires :body, type: String
      requires :user_id, type: Integer
      requires :images_attributes, type: Array do
        requires :url, type: String
      end
    end
    post do
      post = User.find(params[:user_id]).posts.create!(params)
      present post, with: Blog::Entities::Post
    end

    route_param :post_id do
      get do
        post = User.find(params[:user_id]).posts.published.find(params[:post_id])
        present post, with: Blog::Entities::Post
      end

      params do
        requires :user_id
        optional :title, type: String
        optional :body, type: String
      end

      patch do
        post = User.find(params[:user_id]).posts.find(params[:post_id])
        post.update(declared(params, include_missing: false).without(:user_id))
      end
      delete do
        User.find(params[:user_id]).posts.destroy(params[:post_id])
      end
    end
  end
end