 
var questions = [
      {
        question: "1：忙碌了一週，周末的早晨你會？",
        choices: ["早起幹活", "睡到餓醒"],
		scores: [1, 2],
		answered: false
      },
      {
        question: "2：肚子餓了，早餐你會？",
        choices: ["叫外送", "自己煮", "懶得吃"],
		scores: [1, 2, 3],
		answered: false
      },
      {
        question: "3：手機響了，你覺得是誰？",
        choices: ["垃圾詐騙電話", "朋友揪出門", "同事找你代班"],
		scores: [1, 2, 3],
		answered: false
      },
      {
        question: "4：出門被鳥屎砸到，你會？",
        choices: ["默默清理", "發限時動態", "幸運之神降落，趕快買張樂透"],
		scores: [1, 2, 3],
		answered: false
      }
    ];

    var currentQuestion = 0;
    var answers = [];

    function displayQuestion() {
      var questionContainer = document.getElementById('question');
      questionContainer.innerHTML = questions[currentQuestion].question;

      var choicesContainer = document.getElementById('choices');
      choicesContainer.innerHTML = '';

      for (var i = 0; i < questions[currentQuestion].choices.length; i++) {
        var choice = document.createElement('button');
        choice.textContent = questions[currentQuestion].choices[i];
        choice.onclick = selectAnswer;
        choicesContainer.appendChild(choice);
      }
    }

    function selectAnswer(event) {
      if (questions[currentQuestion].answered) {
        return;
      }

      var selectedChoice = event.target.textContent;
      var selectedScore = questions[currentQuestion].scores[questions[currentQuestion].choices.indexOf(selectedChoice)];
      answers[currentQuestion] = selectedScore;
      questions[currentQuestion].answered = true;

      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        displayQuestion();
      } else {
        displayResult();
      }
    }

    function displayResult() {
      var resultContainer = document.getElementById('result');
      var totalScore = answers.reduce(function (a, b) {
        return a + b;
      }, 0);

      resultContainer.innerHTML = '你的分數是：' + totalScore;

      if (totalScore >= 10 && totalScore <= 20) {
        window.location.href = 'https://example.com/result1';
      } else if (totalScore >= 21 && totalScore <= 30) {
        window.location.href = 'https://example.com/result2';
      } else if (totalScore >= 31 && totalScore <= 40) {
        window.location.href = 'https://example.com/result3';
      } else {
        window.location.href = 'https://example.com/result4';
      }
    }
 displayQuestion();// JavaScript Document