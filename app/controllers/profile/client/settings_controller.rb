class Profile::Client::SettingsController < ProfileController
  def index
    @user_profile
  end

  def update
    @user_profile.update_attributes(user_profile_params)
    respond_to do |format|
      format.html { render :index, notice: "Settings successfully updated" }
    end
  end

  private

  def user_profile_params
    params.require(:profile)
          .permit(:first_name, :last_name, :avatar, :phone)
  end
end
