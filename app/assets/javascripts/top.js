// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

"use strict";

(function(global, namespace) {
    /**
     * ドットで区切られた文字列を展開し、グローバル領域に定義していきます。
     * @param {string} str 名前空間用の文字列。
     * @return {object} 最後に定義されたオブジェクト。
     */
    function Namespace(str) {
        var ns = str.split('.');
        var here = global;
        for (var i = 0; i < ns.length; i++){
            if (typeof(here[ns[i]]) === 'undefined') here[ns[i]] = {};
            here = here[ns[i]];
        }
        return here;
    }

    var ns = Namespace(namespace);


    // ----------------------------
    // サムネイルプリロード
    // ----------------------------
    ns.preloadThumbImages = function(image) {
        if (image.loaded)
            return;

        image.list = new Array(15);
        image.count = 0;
        for (var i = 0; i < image.list.length; i++) {
            image.list[i] = new Image();
            image.list[i].src = image.src.replace(/thumb\d\d/, sprintf('thumb%02d', i));
        }

        image.loaded = true;
    };


    // ----------------------------
    // サムネイル変更用の関数
    // ----------------------------
    ns.change = function(image, count) {
        if (0 <= count && count < image.list.length)
            image.count = count;
        else
            image.count = (image.count + 1) % image.list.length;

        image.src = image.list[image.count].src;
    };



    // ----------------------------
    // 新着欄を表示
    // ----------------------------
    ns.setNewTable = function(json) {
        var items = json['result']['items'];
        var lines = new Array(items.length + 2);

        // lines[0] = sprintf('<div class="row2"><p class="row2-caption">%s</p><div class="slider multiple-items">', json['result']['caption']);
        lines[0] = sprintf('<div class="row2"><p class="row2-caption">%s</p><div">', json['result']['caption']);
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
    };


    // ----------------------------
    // アニメ一覧をソートして表示
    // ----------------------------
    ns.setAnimeTable = function(json, compare) {
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
    };


    // ----------------------------
    // ファイルエントリーを表示
    // ----------------------------
    ns.setExplorer = function (json, compare) {
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


        // ---------------------------
        // フォルダ名をクリックした時の動作を設定
        $('#explorerFolders td').on('click', function(){
            ns.loadingOn();
            var success = function(j){
                ns.setExplorer(j);
                ns.loadingOff();
            };

            var name = $(this).text().trim();
            $.getJSON('/api/bitcasa/folder', {'filepath': path[name]}).success(success).error(ns.loadingOff);
        });

        // ----------------------------
        // ファイル名をクリックした時の動作を設定
        $('#explorerFiles td').on('click', function(){
            var success = function(j){
                videojs('playVideo', {'controls': true}).ready(function(){
                    this.pause();
                    this.src(j['file_URL']);
                    this.load();
                    this.play();
                });
            };

            var name = $(this).text().trim();
            $.getJSON('/api/bitcasa/file', {'filepath': path[name], 'filename': name}).success(success).error(ns.loadingOff);
        });

    };


    // ----------------------------
    // ロード画像のオン・オフ切り替え
    // ----------------------------
    ns.loadingOn = function() {
        $('#explorer .loading').css('display', 'block');
    }

    ns.loadingOff = function() {
        $('#explorer .loading').css('display', 'none');
    }


}(this, "streaming"));
// end-namespace




// ----------------------------
// Main Function - On Load
// ----------------------------
$(function() {
    // 基本データ
    var newList = {"result": {"items": [{"name": "videoName.mp4", "path": "./videos/videoName.mp4"}], "caption": "videoName"}};
    var animeList = {"result": {"items": [{"name": "video1"}, {"name": "video2"}]}};

    // 新着一覧を更新
    streaming.setNewTable(newList);
    // アニメ一覧を更新
    streaming.setAnimeTable(animeList);

    // Bitcasa エクスプローラーを更新
    $.getJSON('/api/bitcasa/folder', {'filepath': '/'}, function(json){
        streaming.setExplorer(json);
        streaming.loadingOff();
    });

    // サムネイル変更のハンドラを設定
    var t;
    $('#new img').hover(
        function() {
            streaming.preloadThumbImages(this);
            t = setInterval(streaming.change, 900, this);
        },
        function() {
            clearInterval(t);
            streaming.change(this, 0);
        });

    // slickの設定
    // $('.multiple-items').slick({
    //   "infinite": false,
    //   "slidesToShow": 6,
    //   "slidesToScroll": 6,
    //   "draggable": false
    // });
});
