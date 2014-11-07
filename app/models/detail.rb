class Detail < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  belongs_to :category
  belongs_to :medium
  belongs_to :genre

  has_one :file,
          class_name: 'DetailFile',
          dependent: :destroy

  has_one :folder,
          class_name: 'DetailFolder',
          dependent: :destroy

  has_many :detail_tags,
           dependent: :destroy

  has_many :tags,
           through: :detail_tags

  has_many :ancestor_relations,
           class_name: 'DetailClosure',
           foreign_key: 'ancestor_detail_id'

  has_many :descendant_relations,
           class_name: 'DetailClosure',
           foreign_key: 'descendant_detail_id'

  has_many :ancestors,
           through: :descendant_relations,
           source: :ancestor_relationship

  has_many :descendants,
           through: :ancestor_relations,
           source: :descendant_relationship

  validates :path,
            presence: true

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


  validate :season_exists?,
           :year_exists?,
           :genre_exists?,
           :category_exists?,
           :medium_exists?

  before_save :not_have_slash, :dir_size


  # 外部キーになかったら入力させない
  private
  def season_exists?
    # nilを許可
    return true if season_id == nil
    unless Season.exists?(season_id)
      errors.add(:season_id, 'season_id is not exist')
    end
  end

  # 外部キーになかったら入力させない
  private
  def year_exists?
    # nilを許可
    return true if year_id == nil
    unless Year.exists?(year_id)
      errors.add(:year_id, 'year_id is not exist')
    end
  end

  # 外部キーになかったら入力させない
  private
  def genre_exists?
    # nilを許可
    return true if genre_id == nil
    unless Genre.exists?(genre_id)
      errors.add(:genre_id, 'genre_id is not exist')
    end
  end

  # 外部キーになかったら入力させない
  private
  def category_exists?
    # nilを許可
    return true if category_id == nil
    unless Category.exists?(category_id)
      errors.add(:category_id, 'category_id is not exist')
    end
  end

  # 外部キーになかったら入力させない
  private
  def medium_exists?
    # nilを許可
    return true if medium_id == nil
    unless Medium.exists?(medium_id)
      errors.add(:medium_id, 'medium_id is not exist')
    end
  end


  # pathが/を含まないことの確認
  # /を含んだらfalseを返す
  public
  def not_have_slash
    !self.path.include?('/') ? true : false
  end


  # directoryのサイズは0であることの確認
  # is_dir = false のとき true
  # is_dir = true かつ size = 0 のとき true
  # is_dir = true かつ size != 0 のとき false
  public
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
