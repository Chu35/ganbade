//test 
var questions = [
      {
        question: "1：忙碌了一週，周末的早晨你會？",
        choices: ["早起幹活", "睡到餓醒"],
		scores: [1, 3],
		answered: false,
		imgtest: "img/t1-1.png"
      },
      {
        question: "2：肚子餓了，早餐你會？",
        choices: ["叫外送", "自己煮", "懶得吃"],
		scores: [1, 2, 3],
		answered: false,
		imgtest: "img/t2.png"
      },
      {
        question: "3：手機響了，你覺得是誰？",
        choices: ["垃圾詐騙電話", "朋友揪出門", "同事找你代班"],
		scores: [1, 2, 3],
		answered: false,
		imgtest:"img/t3.png"
      },
      {
        question: "4：出門被鳥屎砸到，你會？",
        choices: ["默默清理", "發限時動態", "幸運之神降落，趕快買張樂透"],
		scores: [1, 2, 3],
		answered: false,
		imgtest:"img/t4.png"
      }
    ];

    var currentQuestion = 0;
    var answers = [];

    function displayQuestion() {
      var questionContainer = document.getElementById('question1');
      questionContainer.innerHTML = questions[currentQuestion].question;

      var imageContainer = document.getElementById('imgtest');
      imageContainer.src = questions[currentQuestion].imgtest;

      var choicesContainer = document.getElementById('choices');
      choicesContainer.innerHTML = '';

      for (var i = 0; i < questions[currentQuestion].choices.length; i++) {
        var choice = document.createElement('button');
        choice.textContent = questions[currentQuestion].choices[i];
        choice.onclick = selectAnswer;
        choicesContainer.appendChild(choice);
      }

      var backButton = document.getElementById('back');
      if (currentQuestion === 0) {
        backButton.style.display = 'none';
      } else {
        backButton.style.display = 'inline-block';
      }
    }

    function selectAnswer(event) {
      var selectedChoice = event.target.textContent;
      var selectedScore = questions[currentQuestion].scores[questions[currentQuestion].choices.indexOf(selectedChoice)];
      answers[currentQuestion] = selectedScore;

      currentQuestion++;

      if (currentQuestion < questions.length) {
        displayQuestion();
      } else {
        showResults();
      }
    }

    function goBack() {
      if (currentQuestion > 0) {
        currentQuestion--;
        displayQuestion();
      }
    }

    function showResults() {
      var score = calculateScore();
      var iconClass = '';

      var iconPath = ''; // 假設這是本地圖標的基本路徑

      if (score >= 3 && score <= 5) {
          iconPath = 'img/4in1.ico'; 
      } else if (score >= 6 && score <= 8) {
          iconPath = 'img/4in2.ico'; 
      } else if (score >= 9 && score <= 11) {
          iconPath = 'img/4in3.ico'; 
      } else {
          iconPath = 'img/4in4.ico';
      }

      var iconContainer = document.getElementById('user-icon');
      iconContainer.innerHTML = '<img src="' + iconPath + '" alt="Icon">';
      // 關閉模擬框
      var modal = document.getElementById('exampleModaltest');
      if (modal) {
          $(modal).modal('hide');
      }
  }
    

    function calculateScore() {
      var totalScore = 0;
      for (var i = 0; i < answers.length; i++) {
        totalScore += answers[i];
      }
      return totalScore;
    }
 displayQuestion();

 
