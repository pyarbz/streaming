require 'rails_helper'

RSpec.describe DetailFolder, :type => :model do

  subject(:detail) { FactoryGirl.create(:detail_true_folder) }
  subject(:folder) { FactoryGirl.build(:detail_folder)}

  # 成功時の条件
  it "folder should be made this object" do
    folder.detail_id = detail.id
    expect(folder).to be_valid
  end


  describe "validations" do
    # name, folder_hashは空文字不可
    %w{name folder_hash}.each do |column|
      it { is_expected.to validate_presence_of(column) }
    end

    # folder_hashは一意な値(unique)
    it do
      folder.detail_id = detail.id
      expect(folder).to validate_uniqueness_of(:folder_hash)
    end

  end

  describe "foreign key" do
    # detail_idはDetailに無いidを入力不可
    it "should have existence detail_id" do
      folder.detail_id = 1000000
      expect(folder).not_to be_valid
    end
  end

end
