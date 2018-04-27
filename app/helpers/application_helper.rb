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
end
