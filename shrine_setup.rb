# run 'bundle add shrine'
# run 'bundle'
# run 'touch config/initializers/shrine.rb'

def get_attachment_choice
  puts "Which attachment plugin would you like to use? (please type the number only)"
  puts "\t1. ActiveRecord\n\t2. Sequel"
  choice = gets.chomp
  unless choice.to_i == 1 || choice.to_i == 2
    puts "Please ensure you only type '1' or '2'"
    get_attachment_choice
  end
  choice
end

def get_storage_choice(environment_option)
  puts "Which storage would you like to use for #{environment_option}? (please type the number only)"
  puts "\t1. FileSystem (stored on the disk)\n\t2. S3 (stored using a cloud provider such as AWS S3, Digital Ocean Spaces\n\t3.Memory (useful for testing)"
  choice = gets.chomp
  unless choice.to_i == 1 || choice.to_i == 2
    puts "Please ensure you only type '1', '2' or '3'"
    get_storage_choice(environment_option)
  end
  choice
end

attachment = get_attachment_choice
storage = get_storage("test")
storage = get_storage("staging")
storage = get_storage("development")
storage = get_storage("production")
# inject_into_file 'config/initializers/shrine.rb' do <<~EOF
#   require "shrine"
#   require "shrine/storage/file_system"

#   Shrine.storages = {
#     cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
#     store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
#   }

#   Shrine.plugin :activerecord           # loads Active Record integration
#   Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
#   Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
#   EOF
# end

# run 'mkdir app/uploaders'
