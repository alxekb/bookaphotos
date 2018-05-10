class Profile::Photographer::DropboxController < Profile::PhotographerController
  def auth
    url = authenticator.authorize_url redirect_uri: redirect_uri
    redirect_to url
  end

  def auth_callback
    auth_bearer = authenticator.get_token(params[:code], redirect_uri: redirect_uri)
    profile.dropbox_token = auth_bearer.token
    profile.save!
    session[:dropbox_token] = auth_bearer.token
    redirect_to photographer_path
  end

  private

  def authenticator
    client_id = Rails.application.secrets.drop_box_client_key
    client_secret = Rails.application.secrets.drop_box_client_secret

    DropboxApi::Authenticator.new(client_id, client_secret)
  end

  def redirect_uri
    "http://#{request.host_with_port}/photographer/dropbox/auth_callback"
  end
end
