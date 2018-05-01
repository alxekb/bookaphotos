class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :profile
  before_action :set_user

  layout :set_layout

  protected

  def profile
    @user_profile = current_user.profile
  end

  def set_layout
    if current_user.client?
      "client"
    elsif current_user.photographer?
      "photographer"
    else
      "application"
    end
  end

  def set_user
    @user = current_user.decorate
  end
end
