require 'reform/form/validation/unique_validator'
module User::Contract
  class Signup < Reform::Form
    include Sync::SkipUnchanged
    property :name
    property :email
    property :password
    property :password_confirmation, virtual: true

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 },
                      format: { with: Constants::VALID_EMAIL_REGEX },
                      unique: true
    validates :password, presence: true,format: {with: Constants::PASSWORD_FORMAT ,message:"must contain more than 8 characters long,a digit,a lowercase and uppercase character,and a symbol" }, confirmation: true
    validates :password_confirmation, presence: true
  end
end
