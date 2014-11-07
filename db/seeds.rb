# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# medium settings
medium_csv = CSV.readlines('db/data/media.csv')
medium_csv.shift #1行目は飛ばす
medium_csv.each do |row|
  medium = Medium.new
  medium.name = row[0]
  medium.save!
end

# extension_media settings
extension_csv = CSV.readlines('db/data/extension_media.csv')
extension_csv.shift #1行目は飛ばす
extension_csv.each do |row|
  medium = Medium.find_or_create_by(name: row[0])

  extension = if Extension.exists?(name: row[1])
                Extension.find_by(name: row[1])
              else
                Extension.new(
                  name: row[1],
                  medium_id: medium.id
                )
              end

  extension.save!

  # 大文字も作成
  capital_row = row[1].upcase
  extension_capital = if Extension.exists?(name: capital_row)
                        Extension.find_by(name: capital_row)
                      else
                        Extension.new(
                          name: capital_row,
                          medium_id: medium.id
                        )
                      end

  extension_capital.save!

  mimetype = if Mimetype.exists?(name: row[2])
               Mimetype.find_by(name: row[2])
             else
               Mimetype.new(
                 name: row[2],
                 medium_id: medium.id
               )
             end

  mimetype.save!

end

# detail seed
# param_data = {
#   path: '/animetest',
#   parent_id: 1
# }
# CreateObject.create_obj(param_data)

# season settings
# season_csv = CSV.readlines('db/data/season.csv')
# season_csv.shift #1行目は飛ばす
# season_csv.each do |row|
#   season = Season.new
#   season.name = row[0]
#   season.save!
# end

# year settings
# year_renge = 2000..2015
#
# year_renge.each do |year_num|
#   Year.create(year: year_num)
# end
