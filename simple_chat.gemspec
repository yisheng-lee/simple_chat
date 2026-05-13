require_relative "lib/simple_chat/version"

Gem::Specification.new do |spec|
  spec.name        = "simple_chat"
  spec.version     = SimpleChat::VERSION
  spec.authors     = [ "YiSheng, Lee" ]
  spec.email       = [ "yisheng.lee@outlook.com" ]
  spec.homepage    = "https://github.com/yisheng-lee/simple_chat"
  spec.summary     = "A simple chat engine for Rails applications using Turbo and Solid Cable."
  spec.description = "SimpleChat is a Rails engine that provides a ready-to-use chat system. It supports chat rooms, members, and real-time messaging leveraging Turbo Streams and Solid Cable for a modern, reactive experience."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yisheng-lee/simple_chat"
  spec.metadata["changelog_uri"] = "https://github.com/yisheng-lee/simple_chat"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.3"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "solid_cable"
  spec.add_dependency "tailwindcss-rails"
end
