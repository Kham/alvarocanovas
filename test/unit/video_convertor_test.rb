require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  FILES_PATH = File.join(Rails.root,'test/fixtures/files')

  def test_mp4_to_mp4
    c = Paperclip::VideoConvertor.new(File.open(File.join(FILES_PATH,"01.mp4")), {:format => 'mp4', :vconfig => 'ipad'})
    tmp_file = c.make
    assert tmp_file.size > 0
  end


end