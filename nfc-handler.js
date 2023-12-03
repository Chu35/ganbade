document.addEventListener('DOMContentLoaded', function () {
    const questions = document.querySelectorAll('.nfc .nfcpart');
    let currentQuestionIndex = 0;

    function showCurrentQuestion() {
        questions.forEach((question, index) => {
            if (index === currentQuestionIndex) {
                question.style.display = 'block';
            } else {
                question.style.display = 'none';
            }
        });
    }

    function nextQuestion() {
        if (currentQuestionIndex < questions.length - 1) {
            currentQuestionIndex++;
            showCurrentQuestion();
        }
    }

    function prevQuestion() {
        if (currentQuestionIndex > 0) {
            currentQuestionIndex--;
            showCurrentQuestion();
        }
    }

    // Event listeners for next and previous buttons
    const nextButtons = document.querySelectorAll('.nfc .next-button');
    nextButtons.forEach(button => {
        button.addEventListener('click', nextQuestion);
    });

    const prevButtons = document.querySelectorAll('.nfc .prev-button');
    prevButtons.forEach(button => {
        button.addEventListener('click', prevQuestion);
    });

    showCurrentQuestion();
});



$(document).ready(function () {
    function handleNFCTagScanned(element) {
        // 获取当前元素的 YouTube 视频 ID
        var youtubeVideoId = $(element).data('youtube-id');

        // 检查是否存在有效的 YouTube 视频 ID
        if (youtubeVideoId) {
            // 创建一个iframe并嵌入YouTube视频
            var iframeSrc = 'https://www.youtube.com/embed/' + youtubeVideoId + '?autoplay=1';

            // 创建一个iframe并嵌入YouTube视频
            var iframe = $('<iframe width="560" height="315" src="' + iframeSrc + '" frameborder="0" allowfullscreen></iframe>');

            // 将iframe追加到当前元素中
            $(element).append(iframe);

            // 移除点击事件监听，以确保只播放一次
            $(element).off('click');

            console.log("NFC標籤已掃描，播放 YouTube 視頻...");
        }
    }

    // 監聽NFC事件
    $('.nfcpart').on('click', function (event) {
        var target = $(event.target);

        // 检查是否点击的是按钮
        if (!target.is('button')) {
            event.preventDefault();
            handleNFCTagScanned(this);
        }
    });

    // 如果有“聽完了”按钮，也可以添加相应的点击事件
    $('.finish-button').on('click', function (event) {
        // 处理聽完了按钮的点击事件
        console.log("聽完了按钮被点击...");
    });
});

