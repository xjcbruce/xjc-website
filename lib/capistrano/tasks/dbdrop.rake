# 执行db:drop的cap任务
# 仿照https://github.com/capistrano/rails/blob/master/lib/capistrano/tasks/migrations.rake所写
# cap deploy:dbdrop                  # Runs rake db:drop

namespace :deploy do
  task :set_rails_env do
    set :rails_env, (fetch(:rails_env) || fetch(:stage))
  end

  desc 'Runs rake db:drop'
  task dbdrop: [:set_rails_env] do
    on fetch(:migration_servers) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:drop'
        end
      end
    end
  end
end
