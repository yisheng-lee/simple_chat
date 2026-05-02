namespace :simple_chat do
  desc "Setup User table, model and seed data for testing"
  task setup_test_user: :environment do
    # 1. Create Migration
    migration_name = "CreateUsers"
    if !ActiveRecord::Base.connection.table_exists?(:users)
      puts "Creating migration for users table..."
      system("rails generate migration #{migration_name} name:string")
      system("rails db:migrate")
    else
      puts "Users table already exists."
    end

    # 2. Create Model if not exists
    model_path = Rails.root.join("app", "models", "user.rb")
    if !File.exist?(model_path)
      puts "Creating User model..."
      File.open(model_path, "w") do |f|
        f.write <<~RUBY
          class User < ApplicationRecord
          end
        RUBY
      end
    else
      puts "User model already exists."
    end

    # 3. Seed Users
    puts "Seeding 5 users..."
    user_class = "User".safe_constantize
    if user_class
      5.times do |i|
        user_class.find_or_create_by!(name: "Test User #{i + 1}")
      end
      puts "Successfully seeded 5 users."
    else
      puts "Error: User class not found."
    end
  end
end
