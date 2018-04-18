class AddSamplePhotographer < ActiveRecord::Migration[5.1]
  def up
    user = User.create(email: 'photo@grapher.com', password: 'sample123', password_confirmation: 'sample123')
    user.photographer!
  end

  def down
    user = User.find_by(email: 'photo@grapher.com')
    user.destroy!
  end
end
