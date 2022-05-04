require "test_helper"

class SectorsControllerTest < ActionDispatch::IntegrationTest
  test "#index should be success" do
    get sectors_path, headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#index should be success when country is japan" do
    sector1 = create(:sector, country: "jp")
    create(:sector, country: "us")
    country = "jp"

    get sectors_path(country:), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal 1, response_contents[:contents].count
    assert_equal sector1.id, response_contents[:contents].first[:id]
  end
end
