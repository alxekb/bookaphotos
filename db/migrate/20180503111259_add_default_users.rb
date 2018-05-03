class AddDefaultUsers < ActiveRecord::Migration[5.1]
  def up
    admin = AdminUser
                .find_or_create_by(
                  email: 'admin@bookaphotos.com',
                  password: 'rails123',
                  password_confirmation: 'rails123'
                )
    photographer = User
                       .find_or_create_by(
                         email: 'photographer@bookaphotos.com',
                         password: 'rails123',
                         password_confirmation: 'rails123',
                         role: "photographer"
                       )
    client = User
                 .find_or_create_by(
                   email: 'client@bookaphotos.com',
                   password: 'rails123',
                   password_confirmation: 'rails123',
                   role: "client"
                 )
  end

  def down
    AdminUser.find_by(email: 'admin@bookaphotos.com').destroy
    User.find_by(email: 'photographer@bookaphotos.com').destroy
    User.find_by(email: 'client@bookaphotos.com').destroy
  end
end
