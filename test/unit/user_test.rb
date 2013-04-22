require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user validation" do
    user = User.create
    assert user.invalid?
    assert user.errors[:email].include?("can't be blank"), "email is required"
    assert user.errors[:username].include?("can't be blank"), "username is required"
    assert user.errors[:password].include?("can't be blank"), "password is required"
    assert user.errors[:password].include?("can't be blank"), "password confirmation is required"
  end
  
  test "username uniqueness" do
  
  end
end
