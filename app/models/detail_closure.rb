class DetailClosure < ActiveRecord::Base

  belongs_to :descendant_detail,
             :class_name => 'Detail',
             :foreign_key => 'descendant_detail_id'

  belongs_to :ancestor_detail,
             :class_name => 'Detail',
             :foreign_key => 'ancestor_detail_id'

  validates :depth,
            presence: true

  validates :ancestor_detail_id,
            presence: true

  validates :descendant_detail_id,
            presence: true


  validate :ancestor_exists?, :descendant_exists?

  # 外部キーになかったら入力させない
  private
  def ancestor_exists?
    unless Detail.exists?(ancestor_detail_id)
      errors.add(:ancestor_detail_id, 'ancestor_detail_id is not exist')
    end
  end


  # 外部キーになかったら入力させない
  private
  def descendant_exists?
    unless Detail.exists?(descendant_detail_id)
      errors.add(:descendant_detail_id, 'descendant_detail_id is not exist')
    end
  end

end
