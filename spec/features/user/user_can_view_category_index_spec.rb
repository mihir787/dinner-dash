require 'rails_helper'

RSpec.describe "user can view category index" do
  it "user sees category index" do
    default_user = create(:default_user)
    item = create(:item)
    item1 = Item.create(title: "wings", description: "good food", price: 11)
    category = create(:category)
    category.items << [item, item1]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit categories_path

    expect(page).to have_content("main course")

    within(".category_name") do
      click_link_or_button "main course"
    end

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
  end
end
