RsstubeRails::Application.routes.draw do
  get "/:channel_name", to:'feed#for_channel', :defaults => { :format => 'atom' }
  root to:'feed#index'
end
