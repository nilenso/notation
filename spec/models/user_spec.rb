require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a name, an unique email address and a password" do
    new_user = User.new(name: "Name", email: "name@email.com", password: "pwd@123")
    expect(new_user).to be_valid
  end

  it "is not valid without a name" do
    new_user = User.new(name: nil)
    expect(new_user).to_not be_valid
  end

  it "is not valid without a email address" do
    new_user = User.new(email: nil)
    expect(new_user).to_not be_valid
  end

  it "is not valid without a password" do
    new_user = User.new(password: nil)
    expect(new_user).to_not be_valid
  end
end
