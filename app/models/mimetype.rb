class Mimetype < ActiveRecord::Base
  belongs_to :medium
  has_many :detail_files

  validates :name,
            presence: true,
            uniqueness: true

  validate :medium_exists?

  # 外部キーになかったら入力させない
  private
  def medium_exists?
    unless Medium.exists?(medium_id)
      errors.add(:medium_id, 'medium_id is not exist')
    end
  end

end
