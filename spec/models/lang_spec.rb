# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lang, type: :model do
  it "should have a valid factory" do
    expect(build(:lang)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
  end
end
