$(document).ready(function () {
    function handleNFCTagScanned(element) {
        // 获取当前元素的 YouTube 视频 ID
        var youtubeVideoId = $(element).data('youtube-id');

        // 检查是否存在有效的 YouTube 视频 ID
        if (youtubeVideoId) {
            var iframeSrc = 'https://www.youtube.com/embed/' + youtubeVideoId + '?autoplay=1';

            // 创建一个iframe并嵌入YouTube视频
            var iframe = $('<iframe width="560" height="315" src="' + iframeSrc + '" frameborder="0" allowfullscreen></iframe>');

            // 将iframe追加到当前元素中
            $(element).append(iframe);

            console.log("NFC標籤已掃描，播放 YouTube 視頻...");
        }
    }

    // 監聽NFC事件
    $('.nfcpart').on('click', function (event) {
        event.preventDefault();
        handleNFCTagScanned(this);
    });

    // 如果有“聽完了”按钮，也可以添加相应的点击事件
    $('.finish-button').on('click', function (event) {
        // 处理聽完了按钮的点击事件
        console.log("聽完了按钮被点击...");
    });
});
