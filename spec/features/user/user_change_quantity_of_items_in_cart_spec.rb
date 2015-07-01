require "rails_helper"

RSpec.describe "Users" do
  context "all users" do
    it "can change add quanitity in a cart" do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click
      visit checkout_path
      expect(page).to have_content("$0.05")

      click_button "+"  
      expect(page).to have_content(10)
      click_button "+"  
      expect(page).to have_content(15)
      click_button "+"
      expect(page).to have_content(20)
    end

    it "can change add quanitity in a cart" do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click
      visit checkout_path
      expect(page).to have_content("$0.05")

      click_button "-"
      click_button "-"
      click_button "-"
      expect(page).to_not have_content("-$0.10")
      expect(page).to have_content("0.00")
    end
  end
end