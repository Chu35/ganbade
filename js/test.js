
//test 
var questions = [
      {
        question: "1：忙碌了一週，周末的早晨你會？",
        choices: ["早起幹活", "睡到餓醒"],
		scores: [1, 3],
		answered: false,
		imgtest: "https://image1.thenewslens.com/2020/4/f67e18wo2jc0hmw9hp8qc9ap0b7jt0.jpg?auto=compress&h=648&q=80&w=1080%201080w"
      },
      {
        question: "2：肚子餓了，早餐你會？",
        choices: ["叫外送", "自己煮", "懶得吃"],
		scores: [1, 2, 3],
		answered: false,
		imgtest: "https://image1.thenewslens.com/2018/5/v8xarqw6f3e35sman9va5h297jq7s6.jpg?auto=compress&h=90&q=80&w=150"
      },
      {
        question: "3：手機響了，你覺得是誰？",
        choices: ["垃圾詐騙電話", "朋友揪出門", "同事找你代班"],
		scores: [1, 2, 3],
		answered: false,
		imgtest:"https://i1.jueshifan.com/2f5221d51dedbc4f9f/7b077d83/78067f8b/3d522e8301aca54ac078.jpg"
      },
      {
        question: "4：出門被鳥屎砸到，你會？",
        choices: ["默默清理", "發限時動態", "幸運之神降落，趕快買張樂透"],
		scores: [1, 2, 3],
		answered: false,
		imgtest:"https://p3-sign.toutiaoimg.com/mosaic-legacy/7a60008d80887d8a22f~tplv-tt-large.jpeg?x-expires=2002189946&x-signature=XQxv%2FtSqQqGi55afj5TexYpJr9s%3D"
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
      var resultsContainer = document.getElementById('results');
      resultsContainer.innerHTML = '您的測評結果：' + calculateScore();

      // 根據分數跳轉到不同的網站
      var score = calculateScore();
      if (3>=score >= 5) {
        window.location.href = 'https://www.example.com/result1';
      } else if (6>=score >= 8){
        window.location.href = 'https://www.example.com/result2';
      }else if (9>=score >= 11){
        window.location.href = 'https://www.example.com/result3';
      }else {
        window.location.href = 'https://www.example.com/result4';
      }
    }

    function calculateScore() {
      var totalScore = 0;
      for (var i = 0; i < answers.length; i++) {
        totalScore += answers[i];
      }
      return totalScore;
    }
 displayQuestion();// JavaScript Document