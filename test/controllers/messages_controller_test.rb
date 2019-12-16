require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  # include devise testing
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  setup do
    get "/users/sign_in"
    sign_in users(:test_user)
    post user_session_url
    follow_redirect!
    assert_response :success
  end

  # test "get message index" do
  #  get "/"
  #  assert_response :success
  # end
end
