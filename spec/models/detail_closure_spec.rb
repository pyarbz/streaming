require 'rails_helper'

RSpec.describe DetailClosure, :type => :model do

  subject(:detail) { FactoryGirl.create(:detail_true_folder) }
  subject(:detail_closure) { FactoryGirl.build(:detail_closure) }

  # 成功時の条件
  it "folder should be made this object" do
    detail_closure.ancestor_detail_id = detail.id
    detail_closure.descendant_detail_id = detail.id
    expect(detail_closure).to be_valid
  end

  describe "validations" do
    # ancestor_detail_id, descendant_detail_id, depthは空文字不可
    %w{ancestor_detail_id descendant_detail_id depth}.each do |column|
      it { is_expected.to validate_presence_of(column) }
    end
  end

  describe "foreign key" do
    # Detailに無いidを入力不可
    %w{ancestor_detail_id descendant_detail_id}.each do |column|
      it "should have existence #{column}" do
        # file.detail_id = 1000000
        detail_closure[column] = 100000
        expect(detail_closure).not_to be_valid

      end
    end
  end

end
