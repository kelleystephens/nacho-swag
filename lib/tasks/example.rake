namespace :example do
  desc "Drop all users"
  task :drop_users => :environment do
    users = User.all.count
    puts "Dropping #{users} users"
    User.delete_all
    users = User.all.count
    puts "#{users} in database"
  end
end
