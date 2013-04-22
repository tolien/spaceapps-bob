require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  setup do
    @user_one = users(:one)
  end
  
  test "user validation" do
    user = User.create
    assert user.invalid?
    assert user.errors[:email].include?("can't be blank"), "email is required"
    assert user.errors[:username].include?("can't be blank"), "username is required"
    assert user.errors[:password].include?("can't be blank"), "password is required"
    assert user.errors[:password].include?("can't be blank"), "password confirmation is required"
  end
  
  test "username uniqueness" do
    user = User.create
    user.username = @user_one.username
    user.email = "2" + @user_one.email
    user.password = 'password'
    user.password_confirmation = 'password'
    
    user.id = nil
    assert user.invalid?
    assert user.errors[:username].include?("has already been taken")
  end
  
  test "password confirmation" do
    user = User.create
    user.username = @user_one.username + "2"
    user.email = "2" + @user_one.email
    user.password = 'password'
    user.password_confirmation = 'password'
    
    assert user.valid?
    
    user.password = 'password1'
    assert user.invalid?
    assert user.errors[:password].include?("doesn't match confirmation")
    
    user.password_confirmation = 'password1'
    assert user.valid?
    assert_nothing_raised do
      user.save!
    end
  end
end
