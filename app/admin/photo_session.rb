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

      f.inputs 'Covers' do
        f.has_many :covers do |c|
          hint = c.object.nil? ? c.template.content_tag(:span, 'No cover yet')
                                     : c.template.image_tag(c.object.photo.url(:thumb))
          c.input :photo,    as: :file,                     label: 'cover',       hint: hint
          c.input :_destroy, as: :boolean, required: false, label: 'Remove' unless c.object.new_record?
        end
      end

      f.inputs 'Photos' do
        f.has_many :photos do |p|
          hint = p.object.nil? ? p.template.content_tag(:span, 'No photo yet')
                                     : p.template.image_tag(p.object.photo.url(:thumb))
          p.input :photo,    as: :file,                     label: 'photo',       hint: hint
          p.input :_destroy, as: :boolean, required: false, label: 'Remove' unless p.object.new_record?
        end
      end

      f.has_many :session_days do |s|
        s.input :when, as: :just_datetime_picker
        s.input :special
        s.input :price
        s.input :_destroy, as: :boolean, required: false, label: 'Remove' if s.object.present?
      end

      f.input :user
      f.input :description
      f.input :duration
      f.input :photos_count
      f.input :period_of_execution
      f.input :price
      f.input :cities, as: :check_boxes
      f.input :themes, as: :check_boxes
    end
    f.actions
  end

end
