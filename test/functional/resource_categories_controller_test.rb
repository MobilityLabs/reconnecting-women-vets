require 'test_helper'

class ResourceCategoriesControllerTest < ActionController::TestCase
  setup do
    @resource_category = resource_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_category" do
    assert_difference('ResourceCategory.count') do
      post :create, resource_category: { name: @resource_category.name }
    end

    assert_redirected_to resource_category_path(assigns(:resource_category))
  end

  test "should show resource_category" do
    get :show, id: @resource_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_category
    assert_response :success
  end

  test "should update resource_category" do
    put :update, id: @resource_category, resource_category: { name: @resource_category.name }
    assert_redirected_to resource_category_path(assigns(:resource_category))
  end

  test "should destroy resource_category" do
    assert_difference('ResourceCategory.count', -1) do
      delete :destroy, id: @resource_category
    end

    assert_redirected_to resource_categories_path
  end
end
