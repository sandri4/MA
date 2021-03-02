ActiveAdmin.register Post do
  permit_params :title, :body, :user_id, :published_at

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :user
    column 'User ID', :user_id
    column :images
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :body
  filter :user
  filter :user_id, label: 'user id'
  filter :images
  filter :published_at
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user
      f.input :published_at
      f.input :images
    end
    f.actions
  end

end
