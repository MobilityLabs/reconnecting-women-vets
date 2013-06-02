require 'rake'

namespace :db do
  desc "Drop, create, migrate then seed the database"
  task :recreate => :environment do
# TODO: Refactor this task to use command line variables instead of ENV variables
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end