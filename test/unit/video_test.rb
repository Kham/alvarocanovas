require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  FILES_PATH = File.join(Rails.root,'test/fixtures/files')

  def setup
    #system "RAILS_ENV=#{Rails.env} script/delayed_job restart"
  end

  def test_video_is_converted_to_flv
    video = Video.create!(:source => File.open(File.join(FILES_PATH, "01.mp4")))



    #assert_equal false, FileTest.exists?(flv_path), "no file #{flv_path}"
    Delayed::Job.work_off
    assert FileTest.exists?(video.source.path(:flv)), "no flv file "
    assert FileTest.exists?(video.source.path(:mp4)), "no mp4 file "
    assert FileTest.exists?(video.source.path(:ogv)), "no ogv file "

    video.source.reprocess!
    assert FileTest.exists?(video.source.path(:flv)), "no flv file "
    assert FileTest.exists?(video.source.path(:mp4)), "no mp4 file "
    assert FileTest.exists?(video.source.path(:ogv)), "no ogv file "

    
  end

end
