require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "password is hashed on create" do
    user = User.create(email: @user.email, password: "123456789012")
    assert_not_equal "123456789012", user.password_digest
  end

  test "password is required" do
    user = User.new(email: "test@example.com")
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test "password must be at least 12 characters long" do
    user = User.new(email: "test@example.com", password: "1234567890")
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 12 characters)"
  end

  test "password is at least 12 characters long" do
    user = User.new(email: "test@example.com", password: "123456789012")
    assert user.valid?
  end
end