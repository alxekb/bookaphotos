FactoryBot.define do
  factory :selected_option, class: "Order::SelectedOption" do
    association :option, factory: :option
    association :order, factory: :order
  end
end
