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

  describe ".search_by_title_or_note" do
    it "should return all notes having the given string as the substring of title" do
      user = User.create(email: "person@example.com", password: "password")
      _note1 = user.notes.create(title: "New note", body: "This is my new note.")
      note2 = user.notes.create(title: "Ruby", body: "Ruby is awesome.")
      note3 = user.notes.create(title: "ruby on rails", body: "Note: It's a framework")

      result = Note.search_by_title_or_body("Ruby")

      expect(result).to contain_exactly(note2, note3)
    end

    it "should return all notes having the given string as the substring of body" do
      user = User.create(email: "person@example.com", password: "password")
      note1 = user.notes.create(title: "Hacks", body: "This is my new note.")
      _note2 = user.notes.create(title: "Ruby", body: "Ruby is awesome.")
      note3 = user.notes.create(title: "ruby on rails", body: "Note : It's a framework")

      result = Note.search_by_title_or_body("note")

      expect(result).to contain_exactly(note1, note3)
    end

    it "should not return any notes if any of the notes don't have the given string as the substring of title or body" do
      user = User.create(email: "person@example.com", password: "password")
      note1 = user.notes.create(title: "New note", body: "This is my new note.")
      _note2 = user.notes.create(title: "Ruby", body: "Ruby is awesome. Rails is a ruby framework")
      note3 = user.notes.create(title: "ruby on rails", body: "Note : It's a framework")

      result = Note.search_by_title_or_body("note")

      expect(result).to contain_exactly(note1, note3)
    end
  end
end
