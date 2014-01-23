RsstubeRails::Application.routes.draw do
  get "/:channel_name", to:'feed#for_channel'
  root to:'feed#index'
end
