class Picture < ActiveRecord::Base

  belongs_to :category

  has_attached_file :image,
                    :styles => {
                      :small => ['50x50>', 'jpg'],
                      :large => ['798x530><', 'jpg']
                    }
  
  default_scope :order => 'number'

  validates_attachment_presence :image


end
