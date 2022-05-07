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
FactoryBot.define do
  factory :company do
    sequence(:country) { |n| "country_#{n}" }
    sequence(:ticker) { |n| "ticker_#{n}" }
    sequence(:sector_id) { |n| "sector_#{n}" }
  end
end
