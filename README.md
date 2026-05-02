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

This will create `config/initializers/simple_chat.rb`. You can configure your user model there (defaults to `User`).

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

### 4. Setup Test Users (Optional)

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

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
