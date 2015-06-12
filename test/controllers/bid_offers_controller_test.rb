require 'test_helper'

class BidOffersControllerTest < ActionController::TestCase
  setup do
    @bid_offer = bid_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_offer" do
    assert_difference('BidOffer.count') do
      post :create, bid_offer: { offer_id: @bid_offer.offer_id, user_id: @bid_offer.user_id, value: @bid_offer.value }
    end

    assert_redirected_to bid_offer_path(assigns(:bid_offer))
  end

  test "should show bid_offer" do
    get :show, id: @bid_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_offer
    assert_response :success
  end

  test "should update bid_offer" do
    patch :update, id: @bid_offer, bid_offer: { offer_id: @bid_offer.offer_id, user_id: @bid_offer.user_id, value: @bid_offer.value }
    assert_redirected_to bid_offer_path(assigns(:bid_offer))
  end

  test "should destroy bid_offer" do
    assert_difference('BidOffer.count', -1) do
      delete :destroy, id: @bid_offer
    end

    assert_redirected_to bid_offers_path
  end
end
