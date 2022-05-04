# == Schema Information
#
# Table name: sectors
#
#  id       :bigint           not null, primary key
#  country  :string(255)      not null
#  english  :string(255)      not null
#  japanese :string(255)      not null
#
require "test_helper"

class SectorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
