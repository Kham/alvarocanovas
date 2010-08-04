class Category < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy

  before_create {|category|
    category.number = Category.count + 1
  }

  has_attached_file :image,
                    :styles => {
                      :small => ['50x50', :jpg], #{ :geometry => '50x50',   :quality => 40, :format => 'JPG'},
                      :large => ['200x200', :jpg] #{ :geometry => '200x200', :quality => 80, :format => 'JPG'}
                    }


  default_scope :order => 'number'
  
end
