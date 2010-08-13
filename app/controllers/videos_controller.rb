class VideosController < ApplicationController
  
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    send_file @video.source.path(params[:format].to_sym),  :type => Video.attachment_definitions[:source][:styles][params[:format].to_s.to_sym][:content_type], :stream => true
  end
end
