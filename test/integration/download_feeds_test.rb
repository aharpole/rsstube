require 'test_helper'

class DownloadFeedsTest < ActionDispatch::IntegrationTest
  test "can download a YouTube feed" do
    VCR.use_cassette("download_feed") do
      get "/channels/UCy0tKL1T7wFoYcxCe0xjN6Q"
      assert_response :success
      xml = Hash.from_xml response.body
      assert xml.has_key?("feed")
      item = xml.dig("feed","entry").first
      assert_equal ["id", "link", "title", "updated", "content", "author"], item.keys
    end
  end
end