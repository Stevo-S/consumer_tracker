require 'test_helper'

class OutgoingMessagesControllerTest < ActionController::TestCase
  setup do
    @outgoing_message = outgoing_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_message" do
    assert_difference('OutgoingMessage.count') do
      post :create, outgoing_message: { message: @outgoing_message.message, recipient: @outgoing_message.recipient }
    end

    assert_redirected_to outgoing_message_path(assigns(:outgoing_message))
  end

  test "should show outgoing_message" do
    get :show, id: @outgoing_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outgoing_message
    assert_response :success
  end

  test "should update outgoing_message" do
    patch :update, id: @outgoing_message, outgoing_message: { message: @outgoing_message.message, recipient: @outgoing_message.recipient }
    assert_redirected_to outgoing_message_path(assigns(:outgoing_message))
  end

  test "should destroy outgoing_message" do
    assert_difference('OutgoingMessage.count', -1) do
      delete :destroy, id: @outgoing_message
    end

    assert_redirected_to outgoing_messages_path
  end
end
