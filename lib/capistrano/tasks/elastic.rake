# encoding: utf-8
namespace :elastic do
  desc "Import with FORCE elastic"
  task :import do
    on roles(:app) do
      within current_path.to_s do
        with rails_env: fetch(:stage) do
          execute :rake, "environment elasticsearch:import:all FORCE=true"
        end
      end
    end
  end
end
