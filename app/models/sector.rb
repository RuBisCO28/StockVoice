# == Schema Information
#
# Table name: sectors
#
#  id       :bigint           not null, primary key
#  country  :string(255)      not null
#  english  :string(255)      not null
#  japanese :string(255)      not null
#
class Sector < ApplicationRecord
  has_many :industries, dependent: :restrict_with_exception
end
