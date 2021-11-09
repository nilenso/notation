require "rails_helper"

RSpec.describe Note, type: :model do
  @user = User.new
  note = @user.notes.new(
    title: "Anything",
    body: "About anything",
    user_id: "41b98f04-3ffd-11ec-9356-0242ac130003"
  )
  it "is not valid without a title" do
    expect(note).to be_valid
  end
  it "is not valid without a body" do
    expect(note).to be_valid
  end
  it "is not valid without a user_id" do
    expect(note).to be_valid
  end
end
