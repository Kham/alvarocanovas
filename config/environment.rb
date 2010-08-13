# Load the rails application
require File.expand_path('../application', __FILE__)

Dir.glob(File.join(File.expand_path(Rails.root), "lib", "paperclip_processors", "*.rb")).each do |processor|
  require processor
end

# Initialize the rails application
Alvarocanovas::Application.initialize!
