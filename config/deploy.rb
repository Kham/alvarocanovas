set :stages, %w{staging production}
require 'capistrano/ext/multistage'

set :application, "alvarocanovas"
set :use_sudo, false
set :checkout, "export"
set :user, "rails"

set :main_server, 'ns0455.ovh.net'
set :password,  Capistrano::CLI.password_prompt("Rails user password on the server : ") #'kz28h42b'

set :scm, :git
set :git_enable_submodules, true

set :repository, "git@github.com:itkin/alvarocanovas.git"
set :deploy_via, :remote_cache

role :app, main_server
role :web, main_server
role :db,  main_server, :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with passenger"
    task t, :roles => :app do ; end
  end

  task :remove_htaccess, :roles => :app do
    run "rm -f #{release_path}/public/.htaccess"
  end

#  desc "Updates the crontab file using whenever"
#  task :update_crontab, :roles => :app do
#    run "cd #{release_path} && whenever --update-crontab #{application}_#{stage} --set 'environment=#{stage}&cron_log=/var/rails/#{application}/#{stage}/current/log/chores.log'"
#  end
end

namespace :assets do
  task :symlinks, :roles => :app do
    %w{system}.each do |folder|
      run "mkdir -p #{shared_path}/#{folder}"
      run <<-CMD
        rm -rf #{release_path}/public/#{folder} &&
        ln -nfs #{shared_path}/#{folder} #{release_path}/public/#{folder}
      CMD
    end
  end
end

after "deploy:update_code", "deploy:remove_htaccess"
after "deploy:remove_htaccess", "assets:symlinks"

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

#after "delayed_job:restart", "deploy:update_crontab"