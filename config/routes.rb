RsstubeRails::Application.routes.draw do
  get "/:channel_name", to:'feed#for_channel'
  get "/playlists/:playlist_id", to:'feed#for_playlist'
  root to:'feed#index'
end
