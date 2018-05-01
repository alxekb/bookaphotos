require "rails_helper"

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    expect(build(:profile)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone) }

    let(:avatar) { build(:profile) }
    it "should have a thumb style" do
      expect(Profile.attachment_definitions[:avatar][:styles][:thumb]).to eq("16x16#")
    end
    it "should have a medium style" do
      expect(Profile.attachment_definitions[:avatar][:styles][:medium]).to eq("64x64#")
    end
  end
end
