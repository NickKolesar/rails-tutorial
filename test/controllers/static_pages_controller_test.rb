require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  
  def setup
    #Exercise 1 in 3.4.2
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  #Exercise 1 in 3.4.4
  test "should get root" do
    get root_url
    assert_response :success
  end

  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  #Exercise 1 3.4.3 Adding contact page
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
end
