# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  close      :integer          not null
#  high       :integer          not null
#  low        :integer          not null
#  open       :integer          not null
#  ticker     :string(255)      not null
#  trade_date :string(255)      not null
#  volume     :integer          not null
#
require "test_helper"

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
