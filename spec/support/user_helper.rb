require "faker"

def login_user
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if @user
      sign_in @user
    else
      sign_in Factory(:user, :email => Faker::Internet.email)
    end
  end
end