require 'rails_helper'

RSpec.describe Mimetype, :type => :model do

  subject(:medium) { FactoryGirl.create(:medium) }
  subject(:mimetype) { FactoryGirl.build(:mimetype) }

  # 成功時の条件
  it "mimetype should be made this object" do
    mimetype.medium_id = medium.id
    expect(mimetype).to be_valid
  end

  describe "validations" do
    # nameは空文字不可
    it { is_expected.to validate_presence_of(:name) }

    # nameは一意な値(unique)
    it do
      mimetype.medium_id = medium.id
      expect(mimetype).to validate_uniqueness_of(:name)
    end

  end

  describe "foreign key" do
    # medium_idはDetailに無いidを入力不可
    it "should have existence medium_id" do
      mimetype.medium_id = 1000000
      expect(mimetype).not_to be_valid
    end
  end

end
