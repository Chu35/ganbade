$(document).ready(function () {
    function handleNFCTagScanned(youtubeLink) {
        // 检查是否存在有效的 YouTube 视频链接
        if (youtubeLink) {
            // 创建一个iframe并嵌入YouTube视频
            var iframeSrc = youtubeLink.replace('watch?v=', 'embed/') + '?autoplay=1';
            var iframe = $('<iframe width="560" height="315" src="' + iframeSrc + '" frameborder="0" allowfullscreen></iframe>');

            // 将iframe追加到页面中
            $('.nfcpart').empty().append(iframe);

            console.log("NFC标签已扫描，播放 YouTube 视频...");
        }
    }

    // 模拟 NFC 标签扫描事件
    $('#simulate-scan').on('click', function () {
        // 假设这里使用了 nfc-tools 获取了新的 NFC 标签的信息
        var newYoutubeLink = prompt("请输入新的 YouTube 链接：");

        // 调用处理 NFC 标签扫描的函数
        handleNFCTagScanned(newYoutubeLink);
    });

    // 如果有“聽完了”按钮，也可以添加相应的点击事件
    $('.finish-button').on('click', function (event) {
        // 处理聽完了按钮的点击事件
        console.log("聽完了按钮被点击...");
    });
});
