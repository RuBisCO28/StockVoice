# == Schema Information
#
# Table name: companies
#
#  id                   :bigint           not null, primary key
#  country              :string(255)      not null
#  english              :string(255)
#  english_description  :text(65535)
#  fiscal_period        :string(255)
#  japanese             :string(255)
#  japanese_description :text(65535)
#  market               :string(255)
#  ticker               :string(255)      not null
#  sector_id            :string(255)      not null
#
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
