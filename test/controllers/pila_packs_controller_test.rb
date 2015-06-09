require 'test_helper'

class PilaPacksControllerTest < ActionController::TestCase
  setup do
    @pila_pack = pila_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pila_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pila_pack" do
    assert_difference('PilaPack.count') do
      post :create, pila_pack: { name: @pila_pack.name, pila_value: @pila_pack.pila_value, real_value: @pila_pack.real_value }
    end

    assert_redirected_to pila_pack_path(assigns(:pila_pack))
  end

  test "should show pila_pack" do
    get :show, id: @pila_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pila_pack
    assert_response :success
  end

  test "should update pila_pack" do
    patch :update, id: @pila_pack, pila_pack: { name: @pila_pack.name, pila_value: @pila_pack.pila_value, real_value: @pila_pack.real_value }
    assert_redirected_to pila_pack_path(assigns(:pila_pack))
  end

  test "should destroy pila_pack" do
    assert_difference('PilaPack.count', -1) do
      delete :destroy, id: @pila_pack
    end

    assert_redirected_to pila_packs_path
  end
end
