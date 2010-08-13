class Video < ActiveRecord::Base


  has_attached_file :source,
                    :processors => [:video_convertor],
                    :styles => {
                      :flv =>   {:vconfig => :flv, :format => 'flv', :content_type => 'video/flv' },
                      :mp4 => {:vconfig => :ipad, :format => 'mp4', :vopt => "-r 30 -async 2 ", :content_type => 'video/mp4'},
                      :ogv =>   {:vconfig => :ogg, :format => 'ogv' , :content_type => 'video/ogg'}
                 #     :jpg =>   {:format => 'jpg'}
                    }

  

#  process_in_background :source
  
  validates_attachment_presence :source



end


