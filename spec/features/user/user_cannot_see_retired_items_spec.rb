require "rails_helper"

RSpec.describe "user item list" do
  context "when a non admin visits site" do
    it "can not see retired items" do
      5.times do |x|
        create(:item, title: "Item#{x}")
      end

      create(:item, title: "Retired Item", status: "retired")

      visit items_path

      expect(page).to have_content("Item0")
      expect(page).to have_content("Item1")
      expect(page).to have_content("Item2")
      expect(page).to have_content("Item3")
      expect(page).to have_content("Item4")
      expect(page).not_to have_content("Retired Item")
    end
  end
end
