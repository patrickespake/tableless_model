require 'test_helper'

class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create <%= file_name %>" do
    assert_difference('<%= class_name %>.count') do
      post :create, :<%= file_name %> => { }
    end

    assert_redirected_to new_<%= table_name %>_path
  end
end
