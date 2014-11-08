class Paystub
  include Mongoid::Document
  field :pay_period1, type: Date
  field :pay_period2, type: Date
  field :income, type: Float

  belongs_to :user
end
