class Picture < ActiveRecord::Base

  belongs_to :category

  has_attached_file :image,
                    :styles => {
                      :small => ['80x60>', 'jpg'],
                      :large => ['800x533><', 'jpg']
                    }
  
  default_scope :order => 'number'

  validates_attachment_presence :image


end
