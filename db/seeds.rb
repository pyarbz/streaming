# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Season.create(name: "spring")
Season.create(name: "summer")
Season.create(name: "autumn")
Season.create(name: "winter")

Year.create(year: 2000)
Year.create(year: 2001)
Year.create(year: 2002)
Year.create(year: 2003)
Year.create(year: 2004)
Year.create(year: 2005)
Year.create(year: 2006)
Year.create(year: 2007)
Year.create(year: 2008)
Year.create(year: 2009)
Year.create(year: 2010)
Year.create(year: 2011)
Year.create(year: 2012)
Year.create(year: 2013)
Year.create(year: 2014)
Year.create(year: 2015)

video = Media.new(name: "video")
video.categories.build(name: "アニメ")
video.categories.build(name: "ドラマ")
video.categories.build(name: "実写")
video.save

audio = Media.new(name: "audio")
audio.categories.build(name: "音楽")
audio.categories.build(name: "ラジオ")
audio.categories.build(name: "勉強")
audio.categories.build(name: "素材")
audio.save

picture = Media.new(name: "picture")
picture.categories.build(name: "漫画")
picture.categories.build(name: "勉強")
picture.categories.build(name: "素材")
picture.categories.build(name: "写真")
picture.categories.build(name: "壁紙")
picture.save

text = Media.new(name: "document")
text.categories.build(name: "勉強")
text.categories.build(name: "メモ")
text.categories.build(name: "仕事")
text.save
