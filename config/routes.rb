RsstubeRails::Application.routes.draw do
  get "/:channel_name",           to:'feed#for_channel',  defaults: { format: 'atom' }
  get "/playlists/:playlist_id",  to:'feed#for_playlist', defaults: { format: 'atom' }
  get "/channels/:channel_id", to: 'feed#for_channel', defaults: {format: 'atom'}
  root                            to:'feed#index'
end
