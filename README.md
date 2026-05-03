# SimpleChat

SimpleChat is a Rails engine that allows you to easily add a chat system to your Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "simple_chat"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install simple_chat
```

## Usage

### 1. Run the generator

Run the install generator to create the configuration file:

```bash
rails generate simple_chat:install
```

This will create `config/initializers/simple_chat.rb`. You can configure your user model and the method to fetch the current user there.

```ruby
SimpleChat.configure do |config|
  # Set the user model (defaults to 'User')
  config.chat_user_model = 'User'

  # Set the method to get the current user in the controller (defaults to :current_user)
  # This is compatible with Devise.
  config.current_user_method = :current_user
end
```

### 2. Run migrations

Copy and run the migrations:

```bash
rails simple_chat:install:migrations
rails db:migrate
```

### 3. Mount the engine

Add the following to your `config/routes.rb` file:

```ruby
mount SimpleChat::Engine => "/chat"
```

Now you can access the chat system at `/chat`.

### 4. Membership

By default, `SimpleChat` requires users to be members of a chat room before they can post messages.
- **Visibility**: On the chat rooms index page, users only see rooms that they are members of.
- **Joining**: When a user creates a new chat room, they are automatically added as a member. For other rooms, users must be added as members (e.g., via console or custom logic) to see them in their list and to access them. Users who are not members will be redirected if they try to access a chat room's page directly.
- **Membership Management**: Membership is managed via the `simple_chat_chat_members` table.

### 5. Setup Test Users (Optional)

For testing purposes, you can quickly set up a `User` model and table with some seed data.

If you are running this within the **gem's development environment** (e.g., in the dummy app), run:

```bash
bin/rails app:simple_chat:setup_test_user
```

If you are running this in a **host Rails application** that has the gem installed, run:

```bash
rails simple_chat:setup_test_user
```

This will:
- Create a migration for the `users` table with a `name` column (if it doesn't exist).
- Run the migration.
- Create a `User` model in `app/models/user.rb` (if it doesn't exist).
- Seed 5 test user records.

### 6. Programmatic Usage

You can create a chat room between multiple users directly from your Rails app:

```ruby
user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)

# Create a chat with multiple users as arguments
chat_room = SimpleChat.create_chat(user1, user2, user3)

# Or pass them as an array
chat_room = SimpleChat.create_chat([user1, user2])

# Or specify a custom title
chat_room = SimpleChat.create_chat(user1, user2, title: "Support Chat")
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
