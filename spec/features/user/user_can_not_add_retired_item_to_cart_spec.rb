require "rails_helper"

RSpec.describe "retired item" do
  it "cannot be added to cart" do
    admin = create(:admin_user)
    item = create(:item, title: "item1")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_items_path

    click_link "item1"
    click_link 'Edit'
    page.choose "item[status]", match: :first 
    click_button "Submit Item"

    visit item_path(item)

    first(:button, "Add To Cart").click
    visit checkout_path
    expect(page).not_to have_content("item1")
  end
end
