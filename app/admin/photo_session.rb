ActiveAdmin.register PhotoSession do

  index do
    column :title
    column :price
    column :user
    column :created_at
    actions
  end

  form do |f|
    f.inputs "PhotoSession Details" do
      f.input :title
      f.input :published
      f.input :user
      f.input :description
      f.input :price
      f.input :cities, as: :check_boxes
      f.input :themes, as: :check_boxes
    end
    f.actions
  end

end
