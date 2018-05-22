require "rails_helper"

RSpec.describe AdditionalOption, type: :model do
  it "has a valid factory" do
    expect(build(:additional_option)).to be_valid
  end

  describe "validations" do
    context "attributes" do
      it { is_expected.to validate_presence_of(:name) }
    end
    context "associations" do
      it { is_expected.to belong_to(:user) }
    end
  end
end
