require "rvm/capistrano"

# set :rvm_ruby_string, :local               # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs

# before 'deploy:setup', 'rvm:install_rvm'   # install RVM
# before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
# before 'deploy:setup', 'rvm:create_gemset' # only create gemset

# set :normalize_asset_timestamps, false     # assets haven't been compiled yet

set :application, "reconnecting.mobility-labs.com"

# Version Control Stuff
set :repository,  "git@github.com:seanperkins/reconnecting-women-vets.git"
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :deploy_via, :remote_cache
set :branch, "master"

# SSH Stuff
set :ssh_options, { forward_agent: true }
ssh_options[:keys] = ["~/.ssh/mob.pem","~/.ssh/marlon.pem"]

role :web, application                            # Your HTTP server, Apache/etc
role :app, application                             # This may be the same as your `Web` server
role :db,  application, :primary => true  # This is where Rails migrations will run

set :user, "ubuntu"
set :use_sudo, false

set :deploy_to, "/home/ubuntu/reconnecting"

set :rails_env, "production"

namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install"
  end

end

# This is for restarting nginx after deployment
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end
# before "deploy:assets:precompile", "bundle:install"