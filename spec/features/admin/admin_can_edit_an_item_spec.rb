require "rails_helper"

RSpec.describe "Admin Items" do
  context "edit item" do
    it "can edit an item" do
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

      fill_in "Item title", with: "Edited Item"
      fill_in "Item description", with: "Edited Description"
      fill_in "Price", with: 600
      click_button "Submit Item"

      expect(page).to have_content("Edited Item")
      expect(page).to have_content("Edited Description")
      expect(page).to have_content(6)
    end

    it "can not change the item title to an already existing title" do
      admin = create(:admin_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Item"

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: "New Item"
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Item"

      visit admin_dashboard_path
      click_link "Add New Item"

      visit admin_dashboard_path
      click_link "Add New Item"

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: "New Item2"
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Item"

      visit admin_items_path
      click_link "New Item"
      click_link "Edit"

      fill_in "Item title", with: "New Item2"
      fill_in "Item description", with: "Edited Description"
      fill_in "Price", with: 600
      click_button "Submit Item"

      expect(page).to have_content("Title has already been taken")
    end
  end
end
