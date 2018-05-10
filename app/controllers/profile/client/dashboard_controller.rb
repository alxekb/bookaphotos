class Profile::Client::DashboardController < Profile::ClientController
  def index
    #TODO get token from photographer photo_sessions
    #TODO move logic to albums controller
    # dropbox_token = profile.dropbox_token
    # @drop_box_user = DropboxApi::Client.new(dropbox_token)
    # @list = @drop_box_user.list_folder("/portret").entries
  end
end
