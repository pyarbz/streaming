"use strict";

// ----------------------------
// Main
// ----------------------------
$(function() {
  // 基本データ
    var entries = '{"result": {"items": [{"name": "videoName.mp4", "path": "./videos/videoName.mp4"}], "caption": "videoName"}}';
    var animeList = '{"result": {"items": [{"name": "video1"}, {"name": "video2"}]}}';

  // 新着一覧更新
  setNewTable(entries);

  // アニメ一覧を更新
  setAnimeTable(animeList);

  // サムネイル変更のハンドラを設定
  var t;
  $('#new img').hover(function() { t = setInterval(change, 800, this); },
                      function() { clearInterval(t); change(this, 0); });

  // slickの設定
  $('.multiple-items').slick({
    "infinite": false,
    "slidesToShow": 6,
    "slidesToScroll": 6,
    "draggable": false
  });
});


// ----------------------------
// サムネイル変更用の関数
// ----------------------------
function change(image, count) {
  if (image.thumbN === undefined || image.count === undefined) {
    image.thumbN = 15;
    image.count = 0;
  }
  if (0 <= count && count < image.thumbN)
    image.count = count;
  else
    image.count = (image.count + 1) % image.thumbN;

  var path = image.src.replace(/thumb\d\d/, sprintf('thumb%02d', image.count));
  image.src = path;
}


// ----------------------------
// 新着欄に1行分を表示
// ----------------------------
function setNewTable(json) {
  var data = $.parseJSON(json);
  var items = data['result']['items'];
  var lines = new Array(items.length + 2);
  lines[0] = '<div class="row2"><p class="row2-caption">{0}</p><div class="slider multiple-items">'.replace('{0}', data['result']['caption']);
  for (var i = 0; i < items.length; i++) {
    var capdir = './capture/' + items[i]['path'].replace(/^\.\//, '').replace(/(\.mp4|\.flv)$/, '');
    var line = '<div><figure><a href="https://dl.dropboxusercontent.com/u/16268979/streaming/{0}"><img src="https://dl.dropboxusercontent.com/u/16268979/streaming/{1}"></a><figcaption><a href="https://dl.dropboxusercontent.com/u/16268979/streaming/{0}">{2}</a></figcaption></figure></div>';
    line = line.replace(/\{0\}/g, items[i]['path']);    
    line = line.replace('{1}', capdir + '/' + 'thumb00.jpg');
    line = line.replace('{2}', items[i]['name']);
    lines[i + 1] = line;
  }
  lines[lines.length - 1] = '</div></div>';
  $('#newList').html(lines.join('\n'));
}


// ----------------------------
// アニメ一覧をソートして表示
// ----------------------------
function setAnimeTable(json, compare) {
  var data = $.parseJSON(json);
  var items = data['result']['items'];
  var names = new Array(items.length);
  for (var i = 0; i < items.length; i++) {
    names[i] = items[i]['name'];
  }

  names.sort(compare);

  var tableLines = new Array(items.length);
  for (var i = 0; i < names.length; i++) {
    tableLines[i] = '<tr><td>' + names[i] + '</td><td></td></tr>';
  }
  $('#animeList tbody').html(tableLines.join('\n'));
}


