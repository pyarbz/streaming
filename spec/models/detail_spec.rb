require 'rails_helper'

RSpec.describe Detail, :type => :model do

  # let(:detail) do
  #   FactoryGirl.build(:detail)
  # end
  subject(:detail) { FactoryGirl.build(:detail) }


  it "Detail should be made this object" do

    d_time = "Mon, 27 Oct 2014 08:44:24 +0000"
    dropbox_modified_at = DateTime.strptime(d_time, '%a, %d %b %Y %T %z').in_time_zone

    detail.path = '/animetest'
    detail.is_dir = true
    detail.dropbox_modified_at = dropbox_modified_at


    detail.size = 0
    expect(detail).to be_valid
  end

  describe "validations" do

    # path, dropbox_modified_at, sizeは空文字不可
    %w{path dropbox_modified_at size}.each do |column|
      it { is_expected.to validate_presence_of(column) }
    end

    # is_dirはnil不可
    it { is_expected.to allow_value(true).for(:is_dir) }
    it { is_expected.to allow_value(false).for(:is_dir) }
    it { is_expected.not_to allow_value(nil).for(:is_dir) }


    # pathの文字数は多くて22文字まで
    it { is_expected.to ensure_length_of(:path).is_at_most(22) }


    # sizeは自然数(0を含む)
    it { is_expected.to validate_numericality_of(:size).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:size).only_integer }

  end

  # pathは/を含めない
  describe :path do
    it "should not include '/'" do

      detail.is_dir = true
      detail.size = 0
      detail.dropbox_modified_at = Time.zone.now


      detail.path = "/hogehoge"
      expect(detail.not_have_slash).to be_falsey
      expect(detail.save).to be_falsey
    end
  end

  # (is_dir == true) かつ (size == 0)となってるか確認
  describe "about directory and size," do
    it "should be saved if is_dir = true and size = 0" do
      detail.is_dir = true
      detail.size = 0

      detail.path = 'animetest'
      detail.dropbox_modified_at = Time.zone.now


      expect(detail.dir_size).to be_truthy
      expect(detail.save).to be_truthy
    end

    it "should be unsaved if is_dir = true and size != 0" do
      detail.is_dir = true
      detail.size = 152

      detail.path = 'animetest'
      detail.dropbox_modified_at = Time.zone.now


      expect(detail.dir_size).to be_falsey
      expect(detail.save).to be_falsey
    end

    it "should be saved if is_dir = false" do
      detail.is_dir = false
      detail.size = 0

      detail.path = 'animetest'
      detail.dropbox_modified_at = Time.zone.now

      expect(detail.dir_size).to be_truthy
      expect(detail.save).to be_truthy
    end

  end

  # set_time_zoneで与えるデータのクラスの確認
  # describe :dropbox_modified_at do
  #   it "is setted as ActiveSupport::TimeWithZone class" do
  #     time = Time.now
  #     expect(detail.set_time_zone(time)).to be_falsey
  #     expect(detail.dropbox_modified_at.blank?).to be_falsey
  #   end
  #
  #   it "is setted as ActiveSupport::TimeWithZone class" do
  #     time = Time.zone.now
  #     expect(detail.set_time_zone(time)).to be_truthy
  #     expect(detail.dropbox_modified_at.blank?).to be_falsey
  #   end
  #
  #   it "is setted as ActiveSupport::TimeWithZone class" do
  #     time = Date.today
  #     expect(detail.set_time_zone(time)).to be_falsey
  #     expect(detail.dropbox_modified_at.blank?).to be_truthy
  #   end
  # end

  # pending "add some examples to (or delete) #{__FILE__}"
end
