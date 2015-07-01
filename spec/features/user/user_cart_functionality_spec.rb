require "rails_helper"

RSpec.describe "checkout" do
  context "as an authenticated user" do
    it "can add items to the cart" do
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      5.times do |x|
        create(:item, title: "Item#{x}", description: "Description #{x}")
      end

      user = create(:default_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path

      click_link "Item1"
      first(:button, "Add To Cart").click

      visit checkout_path

      visit items_path

      click_link "Item1"
      first(:button, "Add To Cart").click

      visit checkout_path
      expect(page).to have_content("Item1")
      expect(page).to have_content("2")
      expect(page).to have_content("Subtotal")
      expect(page).to have_content(10)
    end
  end
end
