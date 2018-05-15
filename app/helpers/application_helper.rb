module ApplicationHelper
  def active_path(path)
    if current_page?(path)
      "nav-item active"
    else
      "nav-item"
    end
  end

  def profile_defined_path
    if current_user.client?
      client_path
    elsif current_user.photographer?
      photographer_path
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("photo_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: { id: id, fields: fields.gsub("\n", "") })
  end
end
