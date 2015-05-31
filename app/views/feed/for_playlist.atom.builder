atom_feed do |feed|
  feed.title "#{params[:channel_name]}'s Uploads"
  feed.updated Time.now
  @feed_entries.each do |item|
    video_id = item["snippet"]["resourceId"]["videoId"]
    feed.entry item, {id:"http://youtube.com/watch?v=#{video_id}", url:"http://youtube.com/watch?v=#{video_id}"} do |entry|
      entry.title item["snippet"]["title"]
      entry.link "http://youtube.com/watch?v=#{video_id}"
      entry.updated item["snippet"]["publishedAt"]
      entry.content <<HTML
<iframe width="560" height="315" src="//www.youtube.com/embed/#{video_id}" frameborder="0" allowfullscreen></iframe>
HTML
      entry.author do |author|
        author.name item["snippet"]["channelTitle"]
      end
    end
  end
end