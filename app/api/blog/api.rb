class Blog::API < Grape::API
  format :json
  prefix :api
  mount Blog::Posts
  # mount Blog::Auth
end