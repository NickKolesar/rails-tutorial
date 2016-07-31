require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @unactivated_user = users(:lana)
  end
  
  test "should redirect to root when user not activated" do
    log_in_as(@user)
    get user_path(@unactivated_user)
    assert_redirected_to root_path
  end

  test "should show active user profile" do
    log_in_as(@user)
    get user_path(@other_user)
    assert_template 'users/show'
    assert_select "h1", text: "Sterling Archer"
  end  


end