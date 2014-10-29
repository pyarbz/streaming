class Detail < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  belongs_to :category
  belongs_to :medium
  belongs_to :genre

  has_one :detail_files,
          :class_name => 'BitcasaFile',
          :dependent => :destroy

  has_one :detail_folders,
          :class_name => 'BitcasaFolder',
          :dependent => :destroy

  has_many :detail_tags,
           :dependent => :destroy

  has_many :tags,
           :through => :detail_tags

  validates :path,
            presence: true,
            length: { maximum: 22 }

  validates :size,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  validates :is_dir,
            inclusion: {
              in: [true, false]
            }

  validates :dropbox_modified_at,
            presence: true

  before_save :not_have_slash, :dir_size


  # pathが/を含まないことの確認
  # /を含んだらfalseを返す


  def not_have_slash
    !self.path.include?('/') ? true : false
  end


  # directoryのサイズは0であることの確認
  # is_dir = false のとき true
  # is_dir = true かつ size = 0 のとき true
  # is_dir = true かつ size != 0 のとき false


  def dir_size
    return true unless self.is_dir
    self.size == 0 ? true : false
  end

  # dropbox_modified_atに時間をセットする
  # Class = Time or DateTime だった場合、time_zoneに直してセット
  # Class = ActiveSupport::TimeWithZone だった場合、そのままセット
  # それ以外はセットしない

  # def set_time_zone(time)
  #   if time.class == Time || time.class == DateTime
  #     self.dropbox_modified_at = time.in_time_zone
  #     false
  #   elsif time.class == ActiveSupport::TimeWithZone
  #     self.dropbox_modified_at = time
  #     true
  #   else
  #     false
  #   end
  # end

end
