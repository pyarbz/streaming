class DetailFolder < ActiveRecord::Base
  belongs_to :detail

  validates :name,
            presence: true

  validates :folder_hash,
            presence: true,
            uniqueness: true

  validate :detail_exists?

  # 外部キーになかったら入力させない
  private
  def detail_exists?
    unless Detail.exists?(detail_id)
      errors.add(:detail_id, 'detail_id is not exist')
    end
  end

end
