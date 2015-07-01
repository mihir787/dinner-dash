require "rails_helper"

RSpec.describe "invalid path" do
  it "directs to page not found" do
    visit '/errors/file_not_found'
    expect(page).to have_content("Page Not Found-404")
  end
end
