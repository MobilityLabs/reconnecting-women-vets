require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get Landing" do
    get :Landing
    assert_response :success
  end

  test "should get Question" do
    get :Question
    assert_response :success
  end

  test "should get End_of_Pathway" do
    get :End_of_Pathway
    assert_response :success
  end

end
