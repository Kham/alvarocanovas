class PicturesController < ApplicationController

  def top_list
    @pictures = Picture.where(:top => true)
  end
    
end
