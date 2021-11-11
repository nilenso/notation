require "rails_helper"

RSpec.describe NotesController, type: :controller do
  describe "GET index" do
    let(:user) { FactoryBot.create(:user) }
    let(:note1) { FactoryBot.create(:note, user: user) }
    let(:note2) { FactoryBot.create(:note, user: user, title: "New note") }
    let(:note3) { FactoryBot.create(:note, user: user, title: "Ruby is awesome") }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    context "when search_key is not present in the query string parameter" do
      it "should list all notes" do
        get :index
        expect(assigns(@user)[:notes]).to contain_exactly(note1, note2, note3)
      end
    end

    context "when value of search_key is empty string" do
      it "should list all notes" do
        params = {"search_key" => ""}
        get :index, params: params
        expect(assigns(@user)[:notes]).to contain_exactly(note1, note2, note3)
      end
    end

    context "when value of search_key is empty string" do
      it "should list all notes" do
        params = {"search_key" => ""}
        get :index, params: params
        expect(assigns(@user)[:notes]).to contain_exactly(note1, note2, note3)
      end
    end

    context "when value of search_key is not empty string, spaces" do
      it "should list all notes which matches with the search_key" do
        params = {"search_key" => "note"}
        get :index, params: params
        expect(assigns(@user)[:notes]).to contain_exactly(note1, note2)
      end
    end
  end
end
