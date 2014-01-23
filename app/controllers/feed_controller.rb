class FeedController < ApplicationController
  def for_channel
    resp = HTTParty.get("http://gdata.youtube.com/feeds/api/users/#{params[:channel_name]}/uploads?v=2&alt=json")
    raise "Bad YouTube response" if resp.code != 200
    @feed_entries = feed_entries(resp.body)
    
    respond_to do |format|
      format.atom
    end
  end
  
  def index
    
  end
  
  private
  def feed_entries(json)
    feed_hash = JSON.parse json
    feed_hash["feed"]["entry"]
  end
end