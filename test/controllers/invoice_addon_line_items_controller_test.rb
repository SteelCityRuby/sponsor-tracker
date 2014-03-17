require 'test_helper'

class InvoiceAddonLineItemsControllerTest < ActionController::TestCase
  setup do
    @invoice_addon_line_item = invoice_addon_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_addon_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_addon_line_item" do
    assert_difference('InvoiceAddonLineItem.count') do
      post :create, invoice_addon_line_item: { invoice_id: @invoice_addon_line_item.invoice_id, package_addon_type_id: @invoice_addon_line_item.package_addon_type_id, quantity: @invoice_addon_line_item.quantity }
    end

    assert_redirected_to invoice_addon_line_item_path(assigns(:invoice_addon_line_item))
  end

  test "should show invoice_addon_line_item" do
    get :show, id: @invoice_addon_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_addon_line_item
    assert_response :success
  end

  test "should update invoice_addon_line_item" do
    patch :update, id: @invoice_addon_line_item, invoice_addon_line_item: { invoice_id: @invoice_addon_line_item.invoice_id, package_addon_type_id: @invoice_addon_line_item.package_addon_type_id, quantity: @invoice_addon_line_item.quantity }
    assert_redirected_to invoice_addon_line_item_path(assigns(:invoice_addon_line_item))
  end

  test "should destroy invoice_addon_line_item" do
    assert_difference('InvoiceAddonLineItem.count', -1) do
      delete :destroy, id: @invoice_addon_line_item
    end

    assert_redirected_to invoice_addon_line_items_path
  end
end
