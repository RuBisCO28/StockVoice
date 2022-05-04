# == Schema Information
#
# Table name: sectors
#
#  id       :bigint           not null, primary key
#  country  :string(255)      not null
#  english  :string(255)      not null
#  japanese :string(255)      not null
#
FactoryBot.define do
  factory :sector do
    sequence(:japanese) { |n| "jp_#{n}" }
    sequence(:english) { |n| "en_#{n}" }
    sequence(:country) { |n| "country_#{n}" }
  end
end
