# frozen_string_literal: true

require "rails_helper"

RSpec.describe Theme, type: :model do
  it "should have a valid factory" do
    expect(build(:theme)).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
end
