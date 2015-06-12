require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { actual_price: @offer.actual_price, event_date: @offer.event_date, event_description: @offer.event_description, event_name: @offer.event_name, expire_date: @offer.expire_date, is_active: @offer.is_active, is_auction: @offer.is_auction, starting_price: @offer.starting_price, user_id: @offer.user_id }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { actual_price: @offer.actual_price, event_date: @offer.event_date, event_description: @offer.event_description, event_name: @offer.event_name, expire_date: @offer.expire_date, is_active: @offer.is_active, is_auction: @offer.is_auction, starting_price: @offer.starting_price, user_id: @offer.user_id }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
