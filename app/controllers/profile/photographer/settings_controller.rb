class Profile::Photographer::SettingsController < Profile::PhotographerController
  def index
  end

  def update
    @user_profile.update_attributes(profile_params)
    if params[:remove_avatar] == "1"
      @user_profile.avatar.destroy
    end
    redirect_to photographer_settings_path, notice: 'Profile was successfully updated!'
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :phone,
      :avatar,
      :remove_avatar
    )
  end
end
