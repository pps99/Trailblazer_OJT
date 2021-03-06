module User::Contract
  class ResetPasswordForm < Reform::Form
    property :password
    property :password_confirmation, virtual: true

    validates :password, presence: true,format: {with: Constants::PASSWORD_FORMAT}, confirmation: true
    validates :password_confirmation, presence: true
  end
end
