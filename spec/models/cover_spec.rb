# frozen_string_literal: true

require "rails_helper"

RSpec.describe Cover, type: :model do
  it "should have a valid factory" do
    expect(build(:cover)).to be_valid
  end

  describe "validations" do
    let(:cover) { build(:cover) }
    it "should have a thumb style" do
      expect(Cover.attachment_definitions[:photo][:styles][:thumb]).to eq("100x100#")
    end
    it "should have a medium style" do
      expect(Cover.attachment_definitions[:photo][:styles][:medium]).to eq("300x300#")
    end
  end
end
