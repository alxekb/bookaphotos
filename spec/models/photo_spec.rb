# frozen_string_literal: true

require "rails_helper"

RSpec.describe Photo, type: :model do
  it "should have a valid factory" do
    expect(build(:photo)).to be_valid
  end

  describe "validations" do
    let(:photo) { build(:photo) }
    it "should have a thumb style" do
      expect(Photo.attachment_definitions[:photo][:styles][:thumb]).to eq("100x100#")
    end
    it "should have a medium style" do
      expect(Photo.attachment_definitions[:photo][:styles][:medium]).to eq("980x520#")
    end
  end
end
