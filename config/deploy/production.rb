role :app, %w(root@46.101.99.231)
role :web, %w(root@46.101.99.231)
role :db,  %w(root@46.101.99.231)

server '46.101.99.231', port: 22, user: 'root', roles: %w(web app)

set :rails_env, 'production'
