# VideoForEveryBody
class ActionView::Base

#  def video_tag_for(video, options={})
#
#    style = {:width => 640, :height => 360, :flash_controls_height => 24 }.update(options.symbolize_keys!.delete(:style) || {})
#
#    content_tag :video, style do
#      tag(:source, :src => "#{video_url video, :mp4}", :type => 'video/mp4')+
#      tag(:source, :src => "#{video_url video, :ogv}", :type => 'video/ogg')+
#      content_tag(:object,
#                  :width =>style[:width],
#                  :height => style[:height]+style[:flash_controls_height],
#                  :type => "application/x-shockwave-flash",
#                  :data => "#{video_url video, :flv }") do
#        tag(:param, :name => "movie", :value => "#{ video_url video, :flv }")+
#        tag(:param, :name => "flashvars", :value =>"autostart=true&amp;image=#{options[:image]}&amp;file=#{video_url video, :mp4 }")+
#        image_tag("#{options[:image]}",
#                  :width => style[:width],
#                  :height => style[:height],
#                  :alt => "#{options[:alt]}",
#                  :title => "No video playback capabilities, please download the video")
#      end
#    end
#  end
end

#<video width="640" height="360" controls autobuffer>
#	<source src="__VIDEO__.MP4"  type="video/mp4" />
#	<source src="__VIDEO__.OGV"  type="video/ogg" />
#	<object width="640" height="384" type="application/x-shockwave-flash" data="__FLASH__.SWF">
#		<param name="movie" value="__FLASH__.SWF" />
#		<param name="flashvars" value="autostart=true&amp;image=__POSTER__.JPG&amp;file=__VIDEO__.MP4" />
#		<img src="__VIDEO__.JPG" width="640" height="360" alt="__TITLE__"
#		     title="No video playback capabilities, please download the video below" />
#	</object>
#</video>
