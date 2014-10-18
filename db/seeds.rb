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

for year_num in 2000..2015 do
  Year.create(year: year_num)
end

# start video settings
video = Media.create(name: "video")
video.extensions.create(name: "mp4")
video.extensions.create(name: "flv")
video.extensions.create(name: "avi")
video.extensions.create(name: "mpeg")
video.extensions.create(name: "mpg")
video.extensions.create(name: "vob")
video.extensions.create(name: "ogm")
video.extensions.create(name: "mov")
video.extensions.create(name: "rm")
video.extensions.create(name: "divx")

anime = video.categories.create(name: "アニメ")
anime.genres.create(name: "日常")
anime.genres.create(name: "ロボット")
anime.genres.create(name: "戦闘")
anime.genres.create(name: "恋愛")

video.categories.create(name: "ドラマ")
video.categories.create(name: "実写")

# end video settings

# start audio settings

audio = Media.create(name: "audio")
audio.extensions.create(name: "wav")
audio.extensions.create(name: "aif")
audio.extensions.create(name: "aiff")
audio.extensions.create(name: "wma")
audio.extensions.create(name: "mp3")
audio.extensions.create(name: "ogg")
audio.extensions.create(name: "m4a")
audio.extensions.create(name: "cda")
audio.extensions.create(name: "cue")
audio.extensions.create(name: "flac")
audio.extensions.create(name: "wv")

audio.categories.create(name: "音楽")
audio.categories.create(name: "ラジオ")
audio.categories.create(name: "勉強")
audio.categories.create(name: "素材")

# end audio settings

# start image settings

picture = Media.create(name: "image")
picture.extensions.create(name: "jpeg")
picture.extensions.create(name: "jpg")
picture.extensions.create(name: "jpe")
picture.extensions.create(name: "jfif")
picture.extensions.create(name: "jfi")
picture.extensions.create(name: "jif")
picture.extensions.create(name: "png")
picture.extensions.create(name: "gif")

picture.categories.create(name: "漫画")
picture.categories.create(name: "勉強")
picture.categories.create(name: "素材")
picture.categories.create(name: "写真")
picture.categories.create(name: "壁紙")

# end image settings

# start document settings
text = Media.create(name: "document")
text.categories.create(name: "勉強")
text.categories.create(name: "メモ")
text.categories.create(name: "仕事")
# end document settings

# start archive settings
archive = Media.create(name: "archive")
archive.extensions.create(name: "zip")
archive.extensions.create(name: "lzh")
archive.extensions.create(name: "rar")
archive.extensions.create(name: "7z")

# end archive settings
