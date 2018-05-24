class Profile::Client::SettingsController < Profile::ClientController
  def index
    @user_profile
  end

  def update
    @user_profile.update_attributes(user_profile_params)
    if params[:remove_avatar] == "1"
      @user_profile.avatar.destroy
    end
    respond_to do |format|
      format.html { redirect_to client_settings_path, notice: "Settings successfully updated" }
    end
  end

  private

  def user_profile_params
    params.require(:profile)
          .permit(:first_name, :last_name, :avatar, :phone, :remove_avatar)
  end
end
