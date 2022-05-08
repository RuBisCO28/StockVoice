# == Schema Information
#
# Table name: cashflows
#
#  id            :bigint           not null, primary key
#  cff           :string(255)      not null
#  cfi           :string(255)      not null
#  cfo           :string(255)      not null
#  fiscal_period :string(255)      not null
#  ticker        :string(255)      not null
#
require "test_helper"

class CashflowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
