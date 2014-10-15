"use strict";

// ----------------------------
// Main Function - On Load
// ----------------------------
$(function() {
    // 基本データ
    var newList = {"result": {"items": [{"name": "videoName.mp4", "path": "./videos/videoName.mp4"}], "caption": "videoName"}};
    var animeList = {"result": {"items": [{"name": "video1"}, {"name": "video2"}]}};

    // 新着一覧を更新
    setNewTable(newList);
    // アニメ一覧を更新
    setAnimeTable(animeList);
    // $.getJSON('https://dl.dropboxusercontent.com/u/16268979/streaming/root_anime_depth20.json', function(json){setAnimeTable(json)});
    // Bitcasa エクスプローラーを更新
    $.getJSON('http://a.pyar.bz/api/folders?filepath=/', function(json){
        setExplorer(json);
        loadingOff();
    });

    // サムネイル変更のハンドラを設定
    var t;
    $('#new img').hover(
        function() {
            preloadThumbImages(this);
            t = setInterval(change, 900, this);
        },
        function() {
            clearInterval(t);
            change(this, 0);
        });

    // slickの設定
    $('.multiple-items').slick({
        "infinite": false,
        "slidesToShow": 6,
        "slidesToScroll": 6,
        "draggable": false
    });
});


// ----------------------------
// サムネイルプリロード
// ----------------------------
function preloadThumbImages(image) {
    if (image.loaded)
        return;

    image.list = new Array(15);
    image.count = 0;
    for (var i = 0; i < image.list.length; i++) {
        image.list[i] = new Image();
        image.list[i].src = image.src.replace(/thumb\d\d/, sprintf('thumb%02d', i));
    }

    image.loaded = true;
}

// ----------------------------
// サムネイル変更用の関数
// ----------------------------
function change(image, count) {
    if (0 <= count && count < image.list.length)
        image.count = count;
    else
        image.count = (image.count + 1) % image.list.length;

    image.src = image.list[image.count].src;
}


// ----------------------------
// 新着欄を表示
// ----------------------------
function setNewTable(json) {
    var items = json['result']['items'];
    var lines = new Array(items.length + 2);

    lines[0] = sprintf('<div class="row2"><p class="row2-caption">%s</p><div class="slider multiple-items">', json['result']['caption']);
    lines[lines.length - 1] = '</div></div>';

    for (var i = 0; i < items.length; i++) {
        var capdir = './capture/' + items[i]['path'].replace(/^\.\//, '').replace(/(\.mp4|\.flv)$/, '');
        var linefmt = '<div><figure><a href="%s"><img src="%s"></a><figcaption><a href="%s">%s</a></figcaption></figure></div>';
        var name = items[i]['name'];
        var path = items[i]['path'];
        var thumb = capdir + '/' + 'thumb00.jpg';

        lines[i + 1] = sprintf(linefmt, path, thumb, path, name);
    }

    $('#newList').html(lines.join('\n'));
}


// ----------------------------
// アニメ一覧をソートして表示
// ----------------------------
function setAnimeTable(json, compare) {
    var items = json['result']['items'];
    var folderNames = [];

    for (var i = 0; i < items.length; i++) {
        folderNames.push(items[i]['name']);
    }

    folderNames.sort(compare);

    var tableLines = [];
    for (var i = 0; i < folderNames.length; i++) {
        tableLines.push('<tr><td>' + folderNames[i] + '</td><td></td></tr>');
    }
    $('#animeList tbody').html(tableLines.join('\n'));
}


// ----------------------------
// ファイルエントリーを表示
// ----------------------------
function setExplorer(json, compare) {
    var items = json['result']['items'];
    var folderNames = [];
    var videoNames = [];
    var path = {};

    // フォルダ名、対応するパスを変数に格納する
    for (var i = 0; i < items.length; i++) {
        if (items[i]['category'] === 'folders') {
            folderNames.push(items[i]['name']);
        }
        else if (items[i]['category'] === 'videos') {
            videoNames.push(items[i]['name']);
        }
        path[items[i]['name']] = items[i]['path'];
    }

    // 名前を並び替える
    folderNames.sort(compare);
    videoNames.sort(compare);

    // テーブルにフォルダ一覧のHTMLをセット
    var tableLines = [];
    for (var i = 0; i < folderNames.length; i++) {
        tableLines.push('<tr><td><span class="glyphicon glyphicon-folder-open"> <a href="javascript:void(0);">' + folderNames[i] + '</a></span></td><td></td></tr>');
    }
    $('#explorerFolders').html(tableLines.join('\n'));

    // テーブルにビデオファイル一覧をセット
    tableLines = [];
    for (var i = 0; i < videoNames.length; i++) {
        tableLines.push('<tr><td><span class="glyphicon glyphicon-folder-open"> <a href="javascript:void(0);">' + videoNames[i] + '</a></span></td><td></td></tr>');
    }
    $('#explorerFiles').html(tableLines.join('\n'));


    // フォルダ名をクリックした時の動作を設定
    $('#explorerFolders td').on('click', function(){
        var name = $(this).text().trim();
        loadingOn();
        var success = function(j){
            setExplorer(j);
            loadingOff();
        };

        var url = 'http://a.pyar.bz/api/folders?filepath=' + path[name];

        $.getJSON(url, success);
    });

    // ファイル名をクリックした時の動作を設定
    $('#explorerFiles td').on('click', function(){
        var name = $(this).text().trim();
        loadingOn();
        var success = function(j){
            var fileURL = j['file_URL'];
            $('#explorer video').css('display', 'block');
            $('#explorer video').attr('src', fileURL);
            $('#explorer video').on('loadeddata', loadingOff);
        };

//        var url = sprintf('http://a.pyar.bz/api/file?filepath=%s&filename=%s', path[name], name);

//        $.getJSON(url).success(success).error(loadingOff);
        var GETURL = 'http://a.pyar.bz/api/file'
        var params = { filepath: path[name],
                       filename: name
                     };
        $.ajax({
            url: GETURL,
            type: 'GET',
            dataType: 'json',
            data: params,
            success: success,
            error: loadingOff
        });
    });

}

// ----------------------------
// ロード画像のオン・オフ切り替え
// ----------------------------
function loadingOn() {
    $('#explorer .loading').css('display', 'block');
}


function loadingOff() {
    $('#explorer .loading').css('display', 'none');
}
