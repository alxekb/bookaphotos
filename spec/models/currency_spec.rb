# frozen_string_literal: true

require "rails_helper"

RSpec.describe Currency, type: :model do
  it "has a valid factory" do
    expect(build(:currency)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
