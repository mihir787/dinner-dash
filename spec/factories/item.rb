FactoryGirl.define do
  factory :item do
    title "item name"
    description "yummy"
    price        5


    factory :item_with_categories do
       after(:create) do |item, evaluator|
        category = create(:category)
        item.item_categories.create(category: category)
      end
    end
  end
end
