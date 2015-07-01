require "rails_helper"

RSpec.describe 'Users' do
  context 'all users' do
    it "can remove cart item" do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click
      visit items_path
      click_link "item2"
      first(:button, "Add To Cart").click
      visit checkout_path
      first(:button, "Remove").click

      expect(page).to_not have_content('item1')
      expect(page).to have_content('item2')
    end
  end
end