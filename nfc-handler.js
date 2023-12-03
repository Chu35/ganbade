$(document).ready(function () {
    // 在這裡處理NFC事件
    // 這只是一個簡單的示例，實際上您需要根據您的需求進行定製
    
    // 當NFC掃描時觸發的事件
    function handleNFCTagScanned() {
        // 在這裡添加播放音樂的代碼
        // 您可以使用HTML5音頻元素或其他JavaScript音頻庫來實現
        console.log("NFC標籤已掃描，播放音樂...");
    }

    // 監聽NFC事件
    $(document).on('click', '.nfcpart a', function (event) {
        event.preventDefault();
        handleNFCTagScanned();
    });
});