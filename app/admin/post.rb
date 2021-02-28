ActiveAdmin.register Post do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    column :user_id
    actions
  end
  show do
    attributes_table do
      row :title
      row :body
      row :user_id
      row :published_at
    end
    active_admin_comments
  end

  filter :title
  filter :user_id
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user_id
    end
    f.actions
  end

end
