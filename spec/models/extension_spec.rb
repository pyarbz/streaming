require 'rails_helper'

RSpec.describe Extension, :type => :model do

  subject(:medium) { FactoryGirl.create(:medium) }
  subject(:extension) { FactoryGirl.build(:extension) }

  # 成功時の条件
  it "extension should be made this object" do
    extension.medium_id = medium.id
    expect(extension).to be_valid
  end

  describe "validations" do
    # nameは空文字不可
    it { is_expected.to validate_presence_of(:name) }

    # nameは一意な値(unique)
    it do
      extension.medium_id = medium.id
      expect(extension).to validate_uniqueness_of(:name)
    end

    # nameの文字数は多くて10文字まで
    it { is_expected.to ensure_length_of(:name).is_at_most(10) }
  end

  describe "foreign key" do
    # medium_idはDetailに無いidを入力不可
    it "should have existence medium_id" do
      extension.medium_id = 1000000
      expect(extension).not_to be_valid
    end
  end

end
