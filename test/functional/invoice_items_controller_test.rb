require 'test_helper'

class InvoiceItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invoice_item
    assert_difference('InvoiceItem.count') do
      post :create, :invoice_item => { }
    end

    assert_redirected_to invoice_item_path(assigns(:invoice_item))
  end

  def test_should_show_invoice_item
    get :show, :id => invoice_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => invoice_items(:one).id
    assert_response :success
  end

  def test_should_update_invoice_item
    put :update, :id => invoice_items(:one).id, :invoice_item => { }
    assert_redirected_to invoice_item_path(assigns(:invoice_item))
  end

  def test_should_destroy_invoice_item
    assert_difference('InvoiceItem.count', -1) do
      delete :destroy, :id => invoice_items(:one).id
    end

    assert_redirected_to invoice_items_path
  end
end
