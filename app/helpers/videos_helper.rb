module VideosHelper

#  def video_tag_for(video, options={})
#
#    style = {:width => 640, :height => 360, :flash_controls_height => 24 }.update(options.symbolize_keys!.delete(:style) || {})
#
#    content_tag :video, style do
#      tag(:source, :src => "#{video_url video, :mp4}", :type => 'video/mp4') +
#      tag(:source, :src => "#{video_url video, :ogv}", :type => 'video/ogg') +
#      content_tag(:object,
#                  :width =>style[:width],
#                  :height => style[:height]+style[:flash_controls_height],
#                  :type => "application/x-shockwave-flash",
#                  :data => "#{video_url video, :flv }") do
#        tag(:param, :name => "movie", :value => "#{ video_url video, :flv }") +
#        tag(:param, :name => "flashvars", :value =>"autostart=true&amp;image=#{options[:image]}&amp;file=#{video_url video, :mp4 }")+
#        image_tag("#{options[:image]}",
#                  :width => style[:width],
#                  :height => style[:height],
#                  :alt => "#{options[:alt]}",
#                  :title => "No video playback capabilities, please download the video")
#      end
#    end
#
#  end

  def formatted_url_for(object,format)
    video_url(object) + ".#{format}" 
  end
  def video_tag_for(video,options={})
    raw  <<-STR
    <video id="video-player" width="800" height="533" controls autobuffer>
      <source src="#{formatted_url_for(video,:mp4)}"  type="video/mp4" />
      <source src="#{formatted_url_for(video,:ogv)}"  type="video/ogg" />
      <object id="player" name="player" width="800" height="533">
        <param name="movie" value="/flash/player.swf" />
        <param name="allowfullscreen" value="true" />
        <param name="allowscriptaccess" value="always" />
        <param name="flashvars" value="file=#{url_encode formatted_url_for(video,:flv)}&skin=#{ "/flash/themes/bekle.zip"}&image=preview.jpg" />
        <embed
          type="application/x-shockwave-flash"
          id="player2"
          name="player2"
          src="/flash/player.swf"
          width="800"
          height="533"
          allowscriptaccess="always"
          allowfullscreen="true"
          flashvars="file=#{url_encode formatted_url_for(video,:flv)}&image=preview.jpg&skin=/flash/themes/bekle.zip"
        />
      </object>
    </video>
    STR
  end

end
#<video width="640" height="360" controls autobuffer>
#</video>
#<source src="#{formatted_url_for(video,:mp4)}"  type="video/mp4" />
#      <source src="#{formatted_url_for(video,:ogv)}"  type="video/ogg" />
#<object width="640" height="384" type="application/x-shockwave-flash" data="/public/flash/player.swf">
#  <param name="movie" value="__FLASH__.SWF" />
#  <param name="flashvars" value="autostart=true&amp;image=__POSTER__.JPG&amp;file="#{formatted_url_for(video,:flv)}" />
#  <img src="__VIDEO__.JPG" width="640" height="360" alt="__TITLE__"
#       title="No video playback capabilities, please download the video below" />
#</object>
