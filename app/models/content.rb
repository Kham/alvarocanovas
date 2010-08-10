class Content < ActiveRecord::Base

  cache_constants :name

  has_attached_file :image,
                    :styles => {
                      :small => ['50x50', :jpg],
                      :large => ['190x200', :jpg]
                    }

end
