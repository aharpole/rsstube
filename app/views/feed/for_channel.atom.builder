atom_feed do |feed|
  feed.title "#{params[:channel_name]}'s Uploads"
  feed.updated Time.now
  @feed_entries.each do |item|
    feed.entry item, {id:item["media$group"]["yt$videoid"]["$t"], url:"http://youtube.com/watch?v=#{item["media$group"]["yt$videoid"]["$t"]}"} do |entry|
      entry.id item["media$group"]["yt$videoid"]["$t"]
      entry.title item["title"]["$t"]
      entry.link item["link"].first["href"]
      entry.content <<EMBED
<iframe width="560" height="315" src="//www.youtube.com/embed/#{item["media$group"]["yt$videoid"]["$t"]}" frameborder="0" allowfullscreen></iframe>
EMBED
      entry.author do |author|
        author.name item["author"].first["name"]["$t"]
      end
    end
  end
end