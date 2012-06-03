require "faker"

def login_user
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if @user
      sign_in @user
    else
      sign_in FactoryGirl.create(:user, :email => Faker::Internet.email)
    end
  end
end

def login_admin
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if @admin
      sign_in @admin
    else
      sign_in FactoryGirl.create(:user, :email => Faker::Internet.email, :role => "admin")
    end
  end
end
