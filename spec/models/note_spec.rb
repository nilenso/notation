require "rails_helper"

RSpec.describe Note, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:note) { FactoryBot.create(:note, user: user) }
  let(:note1) { FactoryBot.create(:note, user: user, title: "Ruby", body: "Ruby is awesome.") }
  let(:note2) { FactoryBot.create(:note, user: user, title: "ruby on rails", body: "Note : It's a framework") }

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
      result = Note.search_by_title_or_body("Ruby")
      expect(result).to contain_exactly(note1, note2)
    end

    it "should return all notes having the given string as the substring of body" do
      result = Note.search_by_title_or_body("note")
      expect(result).to contain_exactly(note, note2)
    end

    it "should return all notes if any of the notes have the given string as the substring of title or body" do
      result = Note.search_by_title_or_body("note")
      expect(result).to contain_exactly(note, note2)
    end

    it "should not return any note if it don't have the given string as the substring of title or body" do
      result = Note.search_by_title_or_body("java")
      expect(result).to be_blank
    end
  end
end
