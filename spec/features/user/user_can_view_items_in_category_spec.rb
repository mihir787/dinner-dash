require 'rails_helper'

RSpec.describe "user can view items in catgory" do

  it "can view items in a corresponding category" do
    default_user = create(:default_user)
    item = create(:item)
    item1 = Item.create(title: "wings", description: "good food", price: 11)
    category = create(:category)

    category.items << [item, item1]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit category_path(category)

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
  end
end
