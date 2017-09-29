require 'test_helper'

class MarkedAdoptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marked_adoption = marked_adoptions(:one)
  end

  test "should get index" do
    get marked_adoptions_url, as: :json
    assert_response :success
  end

  test "should create marked_adoption" do
    assert_difference('MarkedAdoption.count') do
      post marked_adoptions_url, params: { marked_adoption: { adoption_id: @marked_adoption.adoption_id, user_id: @marked_adoption.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show marked_adoption" do
    get marked_adoption_url(@marked_adoption), as: :json
    assert_response :success
  end

  test "should update marked_adoption" do
    patch marked_adoption_url(@marked_adoption), params: { marked_adoption: { adoption_id: @marked_adoption.adoption_id, user_id: @marked_adoption.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy marked_adoption" do
    assert_difference('MarkedAdoption.count', -1) do
      delete marked_adoption_url(@marked_adoption), as: :json
    end

    assert_response 204
  end
end
