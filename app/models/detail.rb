class Detail < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  belongs_to :category
  belongs_to :medium
  belongs_to :genre
  has_one :detail_files, :class_name => 'BitcasaFile', :dependent => :destroy
  has_one :detail_folders, :class_name => 'BitcasaFolder', :dependent => :destroy
  has_many :detail_tags, :dependent => :destroy
  has_many :tags, :through => :detail_tags

  # def have_path(path)
  #   # "hogehoge" # 仮実装
  #   "FOPqySw3ToK_25y-gagUfgs".length
  # end
end
