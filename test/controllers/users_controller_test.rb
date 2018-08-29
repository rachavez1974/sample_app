require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  
	def setup
   	@user = User.new(name: "Razor Ramon", email: "razorcut@gmail.com",
                        password: "foobar", password_confirmation: "foobar")
   	end


  	test "should get new" do
    	get signup_path
    	assert_response :success
  	end

end
