class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_many :employers

  field :first_name, type: String
  field :last_name, type: String
  field :investment_strategy, type: String
  field :health_insurance, type: Float
  field :email, type: String
  field :password_digest, type: String


  has_secure_password

  validates_uniqueness_of :email
end

