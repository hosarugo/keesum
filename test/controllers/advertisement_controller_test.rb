require 'test_helper'

class AdvertisementControllerTest < ActionDispatch::IntegrationTest
  test "should get favorited" do
    get advertisement_favorited_url
    assert_response :success
  end

  test "should get unfavorite" do
    get advertisement_unfavorite_url
    assert_response :success
  end

  test "should get index" do
    get advertisement_index_url
    assert_response :success
  end

  test "should get new" do
    get advertisement_new_url
    assert_response :success
  end

  test "should get create" do
    get advertisement_create_url
    assert_response :success
  end

  test "should get show" do
    get advertisement_show_url
    assert_response :success
  end

  test "should get edit" do
    get advertisement_edit_url
    assert_response :success
  end

  test "should get update" do
    get advertisement_update_url
    assert_response :success
  end

  test "should get destroy" do
    get advertisement_destroy_url
    assert_response :success
  end

  test "should get advertisment_coordinates" do
    get advertisement_advertisment_coordinates_url
    assert_response :success
  end

  test "should get coordinates" do
    get advertisement_coordinates_url
    assert_response :success
  end

  test "should get advertisement_params" do
    get advertisement_advertisement_params_url
    assert_response :success
  end

  test "should get set_advertisement" do
    get advertisement_set_advertisement_url
    assert_response :success
  end

end
