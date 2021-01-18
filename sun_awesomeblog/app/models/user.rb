class User < ApplicationRecord
   #Basic Validations
   validates :name, presence: true, length: { maximum: 50 }
   #To validate correct email structure
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 50 },
                                     format: { with: EMAIL_REGEX },
                                     uniqueness: { case_sensetive: false }
   has_secure_password
   validates :password, length: { minimum: 6 }, allow_nil: true
end
