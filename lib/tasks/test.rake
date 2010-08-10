
namespace :db do
  namespace :fixtures do

    desc "Load seeds then paperclip_files "
    task :load => :environment do
      Rake::Task['db:seed'].invoke :RAILS_ENV => Rails.env
      Rake::Task['db:fixtures:load_paperclip_images'].invoke :RAILS_ENV => Rails.env
    end

    desc "Load paperclip files"
    task :load_paperclip_images => :environment do
      [Category, Client, Picture, Content].each do |klass|
        klass.where("image_file_name IS NOT NULL").each do |instance|
          instance.image = File.new(File.join(Rails.root, "test/fixtures/files/", instance.image_file_name))
          instance.image.reprocess!
          instance.save
        end
      end
    end
  end
end
