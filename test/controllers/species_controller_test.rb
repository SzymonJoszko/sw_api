require "test_helper"

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species = species(:one)
  end

  test "should get index" do
    get species_url, as: :json
    assert_response :success
  end

  test "should create species" do
    assert_difference("Specie.count") do
      post species_url, params: { species: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show species" do
    get species_url(@species), as: :json
    assert_response :success
  end

  test "should update species" do
    patch species_url(@species), params: { species: {  } }, as: :json
    assert_response :success
  end

  test "should destroy species" do
    assert_difference("Specie.count", -1) do
      delete species_url(@species), as: :json
    end

    assert_response :no_content
  end
end
