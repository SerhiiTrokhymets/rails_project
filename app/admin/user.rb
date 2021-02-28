ActiveAdmin.register User do
  permit_params :email, :password, :personal_data, :first_name, :last_name, :birthday

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :personal_data
      row :email
      row :birthday
    end
    active_admin_comments
  end

  filter :email
  filter :last_name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :personal_data
      f.input :email
      f.input :birthday, as: :datepicker,
                         datepicker_options: {
                           min_date: "1930-01-01",
                           max_date: "+1W +5D"
                         }
      f.input :password
    end
    f.actions
  end
end
