require "rails_helper"

RSpec.describe "welcome/index.html.erb", type: :view do
  it "renders a welcome message" do
    render
    expect(rendered).to have_selector("a", text: "Get Started ❯")
  end
end
