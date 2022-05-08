# == Schema Information
#
# Table name: profit_losses
#
#  id                   :bigint           not null, primary key
#  fiscal_period        :string(255)      not null
#  net_operating_profit :string(255)      not null
#  net_profit           :string(255)      not null
#  net_sales            :string(255)      not null
#  ordinary_profit      :string(255)      not null
#  roe                  :string(255)      not null
#  ticker               :string(255)      not null
#
FactoryBot.define do
  factory :profit_loss do
    
  end
end
