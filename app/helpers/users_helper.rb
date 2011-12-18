require 'factory_girl'

module UsersHelper
  def login_user
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
  end
end



