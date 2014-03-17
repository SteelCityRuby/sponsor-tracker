require 'test_helper'

class PackageAddonTypesControllerTest < ActionController::TestCase
  setup do
    @package_addon_type = package_addon_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:package_addon_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package_addon_type" do
    assert_difference('PackageAddonType.count') do
      post :create, package_addon_type: { name: @package_addon_type.name, price: @package_addon_type.price, total_spots: @package_addon_type.total_spots }
    end

    assert_redirected_to package_addon_type_path(assigns(:package_addon_type))
  end

  test "should show package_addon_type" do
    get :show, id: @package_addon_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package_addon_type
    assert_response :success
  end

  test "should update package_addon_type" do
    patch :update, id: @package_addon_type, package_addon_type: { name: @package_addon_type.name, price: @package_addon_type.price, total_spots: @package_addon_type.total_spots }
    assert_redirected_to package_addon_type_path(assigns(:package_addon_type))
  end

  test "should destroy package_addon_type" do
    assert_difference('PackageAddonType.count', -1) do
      delete :destroy, id: @package_addon_type
    end

    assert_redirected_to package_addon_types_path
  end
end
