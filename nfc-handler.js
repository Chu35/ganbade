$(document).ready(function () {
    function handleNFCTagScanned() {
        // 在這裡添加播放音樂的代碼s
        // 這裡使用了 YouTube 嵌入式播放器
        var youtubeVideoId = 'Dnj5Tcpev0Q';
        var iframeSrc = 'https://www.youtube.com/embed/' + youtubeVideoId + '?autoplay=1';

        // 创建一个iframe并嵌入YouTube视频
        var iframe = $('<iframe width="560" height="315" src="' + iframeSrc + '" frameborder="0" allowfullscreen></iframe>');

        // 将iframe追加到页面中
        $('.nfcpart').append(iframe);

        console.log("NFC標籤已掃描，播放 YouTube 視頻...");
    }

    // 監聽NFC事件
    $('.nfcpart').on('click', function (event) {
        event.preventDefault();
        handleNFCTagScanned();
    });
});
