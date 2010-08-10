class Video < ActiveRecord::Base


  has_attached_file :source,
                    :processors => [:convert],
                    :style => { :mpg4 => {}, :flv => {}, :ogg => {}, :jpg => {}}
                    

  validates_attachment_presence :source

end
