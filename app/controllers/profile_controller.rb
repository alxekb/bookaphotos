class ProfileController < ApplicationController
  def show
  end

  def tasks
  end

  def shooting_days
  end

  def photosessions
  end

  def locations
    @locations = current_user.locations
  end

  def invoices
  end
end
