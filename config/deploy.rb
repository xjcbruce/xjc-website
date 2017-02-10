# config valid only for current version of Capistrano
lock "3.7.2"

# set :application, "my_app_name"
# set :repo_url, "git@example.com:me/my_repo.git"

set :application, "xjc_website"
set :repo_url, "git@github.com:xjcbruce/xjc-website.git"

# Default branch is :master
set :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# require "capistrano/rvm"
# RVM path selection: :rvm_type
# :auto (default): just tries to find the correct path. ~/.rvm wins over /usr/local/rvm
# :system: defines the RVM path to /usr/local/rvm
# :user: defines the RVM path to ~/.rvm
set :rvm_type, :auto