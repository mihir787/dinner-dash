require "rails_helper"

RSpec.describe "admin capabilities" do
  context "as admin" do
    it "can retire an item" do
      5.times do |x|
        create(:item, title: "Item#{x}")
      end

      admin = create(:admin_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      within(".admin-links") do
        click_link "All Items"
      end

      expect(current_path).to eq(admin_items_path)

      click_link "Item1"
      click_link "Edit"

      page.choose "item[status]", match: :first
      click_button "Submit Item"

      expect(page).to have_content("retired")
    end
  end
end
