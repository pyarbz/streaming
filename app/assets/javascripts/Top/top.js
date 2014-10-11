"use strict";

// ----------------------------
// Main
// ----------------------------
$(function() {
    // 基本データ
    var entries = '{"result": {"items": [{"name": "第01羽「ひと目で尋常でないもふもふだと見抜いたよ」", "path": "./videos/ご注文はうさぎですか？/第01羽「ひと目で尋常でないもふもふだと見抜いたよ」.mp4"}], "caption": "ご注文はうさぎですか？"}}';
    var animeList = '{"result": {"items": [{"name": "新世界より"}, {"name": "ソードアート・オンライン"}, {"name": "ToLoveる Darkness"}, {"name": "中二病でも恋がしたい"}, {"name": "中二病でも恋がしたい lite"}, {"name": "トータル・イクリプス"}, {"name": "閃乱カグラ"}, {"name": "ラブライブ！"}, {"name": "俺の彼女と幼なじみが修羅場すぎる"}, {"name": "ビビッドレッド・オペレーション"}, {"name": "ささみさん＠がんばらない"}, {"name": "僕は友達が少ない Next"}, {"name": "みなみけ ただいま"}, {"name": "たまこまーけっと"}, {"name": "ToLoveる Darkness"}, {"name": "リトルバスターズ"}, {"name": "GJ部"}, {"name": "進撃の巨人"}, {"name": "百花繚乱 サムライブライド"}, {"name": "惡の華"}, {"name": "変態王子と笑わない猫。"}, {"name": "デート・ア・ライブ"}, {"name": "ゆゆ式"}, {"name": "やはり俺の青春ラブコメはまちがっている。"}, {"name": "とある科学の超電磁砲S"}, {"name": "はたらく魔王さま！"}, {"name": "あいうら"}, {"name": "翠星のガルガンティア"}, {"name": "RDG レッドデータガール"}, {"name": "刀語"}, {"name": "DEVIL SURVIVOR2"}, {"name": "俺の妹がこんなに可愛いわけがない。2"}, {"name": "這いよれ! ニャル子さんW"}, {"name": "UN-GO"}, {"name": "黄昏乙女×アムネジア"}, {"name": "フルメタル・パニック"}, {"name": "輪廻のラグランジェ"}, {"name": "魔法少女まどか☆マギカ GAME"}, {"name": "コードギアス反逆のルルーシュ"}, {"name": "電波女と青春男"}, {"name": "モーレツ宇宙海賊"}, {"name": "迷い猫オーバーラン (完)"}, {"name": "超訳百人一首 うた恋い。"}, {"name": "そらのおとしものF"}, {"name": "海月姫"}, {"name": "電波的な彼女"}, {"name": "神様ドォルズ"}, {"name": "神のみぞ知るセカイ二期"}, {"name": "謎の彼女X"}, {"name": "神のみぞ知るセカイ"}, {"name": "kisssis"}, {"name": "這いよれ！ニャル子さん"}, {"name": "這いよる! ニャルアニ リメンバー・マイ・ラブ"}, {"name": "ヨルムンガンド"}, {"name": "これはゾンビですか？"}, {"name": "らき☆すた (完)"}, {"name": "貧乏神が！"}, {"name": "アクセル・ワールドOVA"}, {"name": "荒川アンダーザブリッジ２"}, {"name": "百花繚乱 サムライガールズ"}, {"name": "花咲くいろは"}, {"name": "パンティ&ストッキング"}, {"name": "聖剣の刀鍛冶"}, {"name": "快盗天使ツインエンジェル"}, {"name": "異国迷路のクロワーゼ"}, {"name": "緋弾のアリア"}, {"name": "セイクリッドセブン"}, {"name": "森田さんは無口。"}, {"name": "未来日記"}, {"name": "ローゼンメイデン"}, {"name": "学園黙示録"}, {"name": "ToHeart2 adnext"}, {"name": "氷菓"}, {"name": "日常"}, {"name": "境界線上のホライゾン"}, {"name": "僕は友達が少ない"}, {"name": "ぬらりひょんの孫~千年魔京~"}, {"name": "攻殻機動隊"}, {"name": "ブラック★ロックシューター"}, {"name": "みなみけ おかわり (完)"}, {"name": "夏雪ランデブー"}, {"name": "偽物語"}, {"name": "バクマン"}, {"name": "狼と香辛料 (完)"}, {"name": "ハヤテのごとく劇場版"}, {"name": "バカとテストと召喚獣にっ！"}, {"name": "ソ・ラ・ノ・ヲ・ト"}, {"name": "スクライド"}, {"name": "コードギアス 反逆のルルーシュR2"}, {"name": "デッドマン・ワンダーランド"}, {"name": "ギルティクラウン"}, {"name": "エウレカセブンAO"}, {"name": "エヴァ"}, {"name": "ベン・トー"}, {"name": "戦国乙女～桃色パラドックス～"}, {"name": "咲-Saki- (完)"}, {"name": "シャイニング・ハーツ ～幸せのパン～"}, {"name": "アマガミSS+ plus"}, {"name": "アイドルマスター"}, {"name": "真剣で私に恋しなさい！！"}, {"name": "アルカナファミリア"}, {"name": "ブラック★ロックシューター OVA"}, {"name": "めだかボックス"}, {"name": "まりあ†ほりっく あらいぶ"}, {"name": "青の祓魔師"}, {"name": "にゃんぱいあ"}, {"name": "とらドラ！ (完)"}, {"name": "とある魔術の禁書目録II"}, {"name": "夏色キセキ"}, {"name": "僕は友達が少ない OVA"}, {"name": "境界線上のホライゾンII"}, {"name": "ちはやふる"}, {"name": "紅 -kurenai- (完)"}, {"name": "ひぐらしのなく頃に"}, {"name": "にょろーん ちゅるやさん (完)"}, {"name": "四畳半神話体系（完）"}, {"name": "夏目友人帳 参"}, {"name": "うらおん! (完)"}, {"name": "そふてにっ"}, {"name": "じょしらく"}, {"name": "しばいぬ子さん"}, {"name": "魔乳秘剣帖"}, {"name": "ストライクウィッチーズ２"}, {"name": "さんかれあ"}, {"name": "これはゾンビですか？ OF THE DEAD"}, {"name": "夏目友人帳 肆"}, {"name": "えむえむっ!"}, {"name": "うぽって！！"}, {"name": "まよチキ"}, {"name": "いちばんうしろの大魔王"}, {"name": "織田信奈の野望"}, {"name": "ひよ恋"}, {"name": "あの日見た花の名前を僕達はまだ知らない。"}, {"name": "アクセル・ワールド"}, {"name": "ラストエグザイル"}, {"name": "星空へ架かる橋"}, {"name": "あっちこっち"}, {"name": "這いよる! ニャルアニ(完)"}, {"name": "ましろ色シンフォニー"}, {"name": "バクマン２"}, {"name": "ハイスクールD×D"}, {"name": "放課後のプレアデス"}, {"name": "けいおん！映画"}, {"name": "つり球"}, {"name": "けいおん!!"}, {"name": "fate prototype"}, {"name": "ドラゴンクライシス"}, {"name": "森田さんは無口。2"}, {"name": "マジでオタクなイングリッシュ！りぼんちゃん"}, {"name": "ToHeart2"}, {"name": "あそびにいくヨ"}, {"name": "けいおん! (完)"}, {"name": "セキレイ～Pure Engagement～"}, {"name": "魔法少女まどか☆マギカ"}, {"name": "猫神やおよろず"}, {"name": "TIGER & BURNY"}, {"name": "パパのいうことを聞きなさい!"}, {"name": "Steins;Gate"}, {"name": "イカ娘"}, {"name": "こどものじかん"}, {"name": "探偵オペラ ミルキィホームズ第2幕"}, {"name": "聖痕のクェイサー"}, {"name": "えびてん"}, {"name": "もやしもん リターンズ"}, {"name": "IS インフィニット・ストラトス"}, {"name": "アクエリオンEVOL"}, {"name": "ゴクジョッ。 極楽院女子高寮物語"}, {"name": "PERSONA trinity soul"}, {"name": "GOSICK"}, {"name": "狼と香辛料II"}, {"name": "Fate Zero"}, {"name": "テイルズ"}, {"name": "FORTUNE ARTERIAL"}, {"name": "人類は衰退しました"}, {"name": "C"}, {"name": "うさぎドロップ"}, {"name": "祝福のカンパネラ"}, {"name": "輪るピンクドラム"}, {"name": "マクロスフロンティア 劇場版"}, {"name": "BRABE10"}, {"name": "アスタロッテのおもちゃ"}, {"name": "それでも町は廻っている"}, {"name": "BLOOD-C"}, {"name": "おとめ妖怪"}, {"name": "クイーンズブレイド リベリオン"}, {"name": "Aちゃんねる"}, {"name": "デュラララ (完)"}, {"name": "ZETMAN"}, {"name": "DOG DAYS\'"}, {"name": "ゆるゆり♪♪"}, {"name": "ToLoveる"}, {"name": "Aちゃんねる OVA"}, {"name": "侵略イカ娘II"}, {"name": "みつどもえ"}, {"name": "喰霊-零- (完)"}, {"name": "TARI TARI"}, {"name": "AKB0048"}, {"name": "WORKING (完)"}, {"name": "もっとToLoveる"}, {"name": "もし高校野球の女子マネージャーがドラッカーの『マネジメント』を読んだら"}, {"name": "C3 -シーキューブ-"}, {"name": "ぬらりひょんの孫"}, {"name": "俺たちに翼はない"}, {"name": "荒川アンダーザブリッジ (完)"}, {"name": "ゼロの使い魔F"}, {"name": "戦国コレクション"}, {"name": "あかね色に染まる坂"}, {"name": "カンピオーネ！ ～まつろわぬ神々と神殺しの魔王～"}, {"name": "化物語DVDアプコン"}, {"name": "とある科学の超電磁砲 (完)"}, {"name": "あの夏で待ってる"}, {"name": "キルミーベイベー"}, {"name": "SKETDANCE"}, {"name": "ダンタリアンの書架"}, {"name": "アイアンマン"}, {"name": "灼眼のシャナS"}, {"name": "30歳の保健体育"}, {"name": "涼宮ハルヒの消失BDアプコン"}, {"name": "B型H系 (完)"}, {"name": "ヨスガノソラ"}, {"name": "はぐれ勇者の鬼畜美学"}, {"name": "咲-Saki- 阿知賀編 episode of side-A"}, {"name": "灼眼のシャナIII"}, {"name": "みつどもえ 増量中！"}, {"name": "ToLoveる darkness OVA"}, {"name": "ロウきゅーぶ!"}, {"name": "ゆるゆり"}, {"name": "Another"}, {"name": "妖狐×僕SS"}, {"name": "神様のメモ帳"}, {"name": "R-15"}, {"name": "たまゆら～hitotose～"}, {"name": "ローゼンメイデン トロイメント"}, {"name": "みなみけ (完)"}, {"name": "だから僕は、Ｈができない。"}, {"name": "スフィアクラブ"}, {"name": "けんぷファー (完)"}, {"name": "屍鬼"}, {"name": "苺ましまろ"}, {"name": "セキレイ"}, {"name": "テガミバチ (完)"}, {"name": "男子高校生の日常"}, {"name": "いっしょにとれーにんぐ"}, {"name": "テルマエロマエ"}, {"name": "聖痕のクェイサー二期"}, {"name": "リコーダーとランドセル レ♪"}, {"name": "涼宮ハルヒの憂鬱BD二音声"}, {"name": "ココロコネクト"}, {"name": "俺の妹がこんなに可愛いわけがない"}, {"name": "アマガミ"}, {"name": "DOG DAYS"}, {"name": "生徒会の一存 (完)"}, {"name": "Angelbeats! (完)"}, {"name": "いっしょにすりーぴんぐ"}, {"name": "咎狗の血"}, {"name": "イカ娘OVA"}, {"name": "東方"}, {"name": "Rio Rainbow Gate！"}, {"name": "clannad"}, {"name": "輪廻のラグランジェ season2"}, {"name": "ふもっふ"}, {"name": "persona4"}, {"name": "とある魔術の禁書目録 (完)"}, {"name": "戦国BASARA弐"}, {"name": "こえでおしごと！"}, {"name": "カイチュー!"}, {"name": "世紀末オカルト学院"}, {"name": "LUPIN the Third ～峰不二子という女～"}, {"name": "バカとテストと召喚獣 (完)"}, {"name": "生徒会役員共"}, {"name": "この中に１人、妹がいる！"}, {"name": "オオカミさんと七人の仲間たち"}, {"name": "明日のよいち！"}, {"name": "テガミバチ REVERSE"}, {"name": "いつか天魔の黒ウサギ"}, {"name": "恋と選挙とチョコレート"}, {"name": "坂道のアポロン"}, {"name": "戦姫絶唱シンフォギア"}, {"name": "そらのおとしもの"}, {"name": "君と僕。2"}, {"name": "WORKING!!"}, {"name": "お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!!"}, {"name": "変ゼミ"}, {"name": "探偵オペラ ミルキィホームズ (完)"}, {"name": "黒執事 II"}, {"name": "マケン姫っ！"}, {"name": "夢喰いメリー"}, {"name": "心霊探偵 八雲"}, {"name": "NO.6"}, {"name": "時をかける少女 (完)"}, {"name": "fatestay"}]}}';

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
        var line = '<div><figure><a href="{0}"><img src="{1}"></a><figcaption><a href="{0}">{2}</a></figcaption></figure></div>';
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
