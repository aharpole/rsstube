RsstubeRails::Application.routes.draw do
  match "/:channel_name", to:'feed#for_channel'
  root to:'feed#index'
end
