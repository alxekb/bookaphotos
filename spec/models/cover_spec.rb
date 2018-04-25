# frozen_string_literal: true

require "rails_helper"

RSpec.describe Cover, type: :model do
  it "should have a valid factory" do
    expect(build(:cover)).to be_valid
  end

  describe "validations" do
    let(:cover) { build(:cover) }
    it "should have a thumb style" do
      Cover.attachment_definitions[:photo][:styles][:thumb].should == "100x100#"
    end
    it "should have a medium style" do
      Cover.attachment_definitions[:photo][:styles][:medium].should == "300x300#"
    end
  end
end
