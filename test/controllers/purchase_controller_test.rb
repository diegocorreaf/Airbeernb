require 'test_helper'

class PurchaseControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get purchase_create_url
    assert_response :success
  end

end
