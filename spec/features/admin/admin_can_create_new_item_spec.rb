require "rails_helper"

RSpec.describe "Admin items" do

  context "as an admin" do
    it "can create a new item" do
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
      expect(page).to have_content("curries")
      expect(page).to have_content("breakfast")
      expect(page).to have_content("New Item")
      expect(page).to have_content("New Description")
      expect(page).to have_content(5)
      visit admin_items_path

      expect(page).to have_content("New Item")
    end   

    it "cannot create a new item with empty title" do
      admin = create(:admin_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Item"

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: ""
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Item"

      expect(page).to have_content("Title can't be blank")
    end

    it "can not create the same item twice" do
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

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: "New Item"
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Item"

      expect(page).to have_content("Title has already been taken")
    end

    it "can not create the same item twice" do
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

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: "New Item"
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Item"

      expect(page).to have_content("Title has already been taken")
    end
  end
end
