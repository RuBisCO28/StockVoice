require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "#index should be success" do
    get companies_path, headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#index should return company information based on sector" do
    company1 = create(:company, sector_id: "1")
    company2 = create(:company, sector_id: "1")
    create(:company, sector_id: "2")
    sector_id = "1"

    get companies_path(sector_id:), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal 2, response_contents[:companies].count
    assert_equal company1.id, response_contents[:companies].first[:id]
    assert_equal company2.id, response_contents[:companies].second[:id]
  end

  test "#show should be success" do
    ticker = "1111"
    get company_path(ticker), headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#show should return company information" do
    company = create(:company, japanese: "任天堂")

    get company_path(company.ticker), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal company[:japanese], response_contents[:company][:japanese]
  end
end
