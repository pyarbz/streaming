class DetailFile < ActiveRecord::Base
  belongs_to :mimetype
  belongs_to :extension
  belongs_to :detail
  has_many :bookmarks, :dependent => :destroy
  has_many :plays, :dependent => :destroy

  validates :name,
            presence: true

  validates :file_modified_at,
            presence: true

  # validates_presence_of :detail
  # validates_presence_of :mimetype, :allow_nil => true
  # validates_presence_of :extension, :allow_nil => true


  validate :detail_exists?, :mimetype_exists?, :extension_exists?


  # 外部キーになかったら入力させない
  private
  def detail_exists?
    unless Detail.exists?(detail_id)
      errors.add(:detail_id, 'detail_id is not exist')
    end
  end


  # 外部キーになかったら入力させない
  private
  def mimetype_exists?
    # nilを許可
    return true if mimetype_id == nil
    unless Mimetype.exists?(mimetype_id)
      errors.add(:mimetype_id, 'mimetype_id is not exist')
    end
  end


  # 外部キーになかったら入力させない
  private
  def extension_exists?
    # nilを許可
    return true if extension_id == nil
    unless Mimetype.exists?(extension_id)
      errors.add(:extension_id, 'extension_id is not exist')
    end
  end


end
