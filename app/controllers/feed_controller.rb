class FeedController < ApplicationController
  def for_channel
    @feed_entries = uploads_feed["items"]
    
    respond_to do |format|
      format.atom
    end
  end
  
  def for_playlist
    @feed_entries = uploads_feed["items"]
    
    respond_to do |format|
      format.atom
    end
  end
  
  def index
    
  end
  
  private
  
  def content_details_feed
    JSON.parse HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=#{params[:channel_name]}&key=#{ENV["YOUTUBE_API_KEY"]}").body
  end
  
  def uploads_playlist_id
    return "UU" + params[:channel_id][2..-1] if params[:channel_id]
    params[:playlist_id] || content_details_feed["items"].first["contentDetails"]["relatedPlaylists"]["uploads"] # TODO: cache these in Redis
  end
  
  def uploads_feed
    JSON.parse HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=#{uploads_playlist_id}&key=#{ENV["YOUTUBE_API_KEY"]}").body
  end
  
  def feed_entries(json)
    feed_hash = JSON.parse json
    feed_hash["feed"]["entry"]
  end
end