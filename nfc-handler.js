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