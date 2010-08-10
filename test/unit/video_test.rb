require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  FILES_PATH = File.join(Rails.root,'test/fixtures/files')

  def test_video_is_converted_to_flv
    Video.create!(:source => File.open(File.join(FILES_PATH, "01.mp4")))
  end

end
