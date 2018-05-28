require "rails_helper"

RSpec.describe Order::SelectedOption, type: :model do
  it "has a valid factory" do
    expect(build(:selected_option)).to be_valid
  end

  describe "validations" do
    context "associations" do
      it { is_expected.to belong_to(:order) }
    end
  end
end
