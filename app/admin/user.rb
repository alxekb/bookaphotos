ActiveAdmin.register User do

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file, hint: f.object.avatar.present? \
    ? image_tag(f.object.avatar.url(:medium))
    : content_tag(:span, "no avatar user yet")
      f.input :langs, as: :check_boxes
    end
    f.actions
  end

  controller do

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

  end

end
