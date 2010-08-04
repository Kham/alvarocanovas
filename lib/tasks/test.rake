
namespace :db do
  namespace :fixtures do
    desc "Fixtures load completed by files using paperclip plugin"
    task :load => :environment do
      [Category, Picture].each do |klass|
        klass.where("image_file_name IS NOT NULL").each do |instance|
          instance.image = File.new(File.join(Rails.root, "test/fixtures/files/", instance.image_file_name))
          instance.image.reprocess!
          instance.save
        end
      end
    end
  end
end
