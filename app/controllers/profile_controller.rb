class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :profile

  layout :set_layout

  def profile
    current_user.profile
  end

  def set_layout
    if current_user.client?
      'application'
    elsif current_user.photographer?
      'photographer'
    else
      'application'
    end
  end
end
