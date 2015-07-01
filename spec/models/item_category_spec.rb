require 'rails_helper'

describe ItemCategory do
  it { should validate_presence_of :category_id}
  it { should validate_presence_of :item_id}
end
