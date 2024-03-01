require "test_helper"

class TableLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get table_links_index_url
    assert_response :success
  end
end
