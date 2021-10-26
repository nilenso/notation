require "rails_helper"

RSpec.describe "welcome/index.html.erb", type: :view do
  it "renders a welcome message" do
    render
    expect(rendered).to have_selector("h1", text: "Notation")
  end
end
