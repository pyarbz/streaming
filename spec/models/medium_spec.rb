require 'rails_helper'

RSpec.describe Medium, :type => :model do

  subject(:medium) { FactoryGirl.build(:medium) }

  # 成功時の条件
  it "medium should be made this object" do
    expect(medium).to be_valid
  end

  describe "validations" do
    # nameは空文字不可
    it { is_expected.to validate_presence_of(:name) }


    # nameは一意な値(unique)
    it { is_expected.to validate_uniqueness_of(:name) }

    # nameの文字数は多くて15文字まで
    it { is_expected.to ensure_length_of(:name).is_at_most(15) }

  end

end
