require 'rails_helper'

RSpec.describe DetailFile, :type => :model do

  subject(:detail) { FactoryGirl.create(:detail_true_file) }
  subject(:file) { FactoryGirl.build(:detail_file)}


  # 成功時の条件
  it "file should be made this object" do
    file.detail_id = detail.id
    expect(file).to be_valid
  end

  describe "validations" do
    # name, file_modified_atは空文字不可
    %w{name file_modified_at}.each do |column|
      it { is_expected.to validate_presence_of(column) }
    end
  end

  describe "foreign key" do
    # detail_idはDetailに無いidを入力不可
    %w{detail_id extension_id mimetype_id}.each do |column|
      it "should have existence #{column}" do
        # file.detail_id = 1000000
        file[column] = 100000
        expect(file).not_to be_valid

      end
    end
  end

end
