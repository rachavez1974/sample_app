require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
    post signup_path, params: { user: { name:  "",
                                         email:        "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select "div.alert", "The form contains 4 errors."

    
  end

  test "Valid signup information" do
      get signup_path
      assert_select 'form[action="/signup"]'
      assert_difference 'User.count' do 2
      post signup_path, params: {user: {name: "John Doe",
                                        email: "jd@juno.com",
                                        password: "foobar",
                                        password_confirmation: "foobar"}}
      end
      follow_redirect!
      assert_template 'users/show'
      assert_not flash.empty?
      assert_select "div.alert", "Welcome to the Sample App!"
  end
end
