class AddDefaultUsers < ActiveRecord::Migration[5.1]
  def up
    admin = AdminUser
                .find_or_initialize_by(
                  email: 'admin@bookaphotos.com',
                )
    admin.password = 'rails123'
    admin.password_confirmation = 'rails123'
    admin.save
    photographer = User
                       .find_or_initialize_by(
                         email: 'photographer@bookaphotos.com',
                       )
    photographer.password = 'rails123'
    photographer.password_confirmation = 'rails12'
    photographer.role = "photographer"
    photographer.save
    client = User
                 .find_or_initialize_by(
                   email: 'client@bookaphotos.com',
                 )
    client.password = 'rails123'
    client.password_confirmation = 'rails123'
    client.role = "client"
    client.save
  end

  def down
    AdminUser.find_by(email: 'admin@bookaphotos.com').destroy
    User.find_by(email: 'photographer@bookaphotos.com').destroy
    User.find_by(email: 'client@bookaphotos.com').destroy
  end
end
