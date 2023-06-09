(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 45) {
                $('.fixed-top').addClass('bg-white shadow');
            } else {
                $('.fixed-top').removeClass('bg-white shadow');
            }
        } else {
            if ($(this).scrollTop() > 45) {
                $('.fixed-top').addClass('bg-white shadow').css('top', -45);
            } else {
                $('.fixed-top').removeClass('bg-white shadow').css('top', 0);
            }
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 100, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });
	
	
  //teas start
const filterOptions = document.querySelectorAll('.search_option .item');
const teaItems = document.querySelectorAll('.tea_list .item');

let selectedTaste = null;
let selectedCategory = null;

filterOptions.forEach(option => {
  option.addEventListener('click', () => {
    const category = option.getAttribute('data-category');
    const taste = option.getAttribute('data-taste');

    const isSelected = option.classList.contains('active');

    if (isSelected) {
      option.classList.remove('active');
      if (category === selectedCategory) {
        selectedCategory = null;
      }
      if (taste === selectedTaste) {
        selectedTaste = null;
      }
    } else {
      filterOptions.forEach(item => {
        item.classList.remove('active');
      });
      option.classList.add('active');
      selectedCategory = category === '全部' ? null : category;
      selectedTaste = taste === '全部' ? null : taste;
    }

    teaItems.forEach(item => {
      const itemCategory = item.getAttribute('data-category');
      const itemTaste = item.getAttribute('data-taste');

      const showItem =
        (!selectedCategory || itemCategory === selectedCategory || selectedCategory === '全部') &&
        (!selectedTaste || itemTaste === selectedTaste || selectedTaste === '全部');

      item.style.display = showItem ? 'block' : 'none';

      const itemIsActive = showItem && (itemCategory === selectedCategory || itemTaste === selectedTaste);
      item.style.opacity = itemIsActive ? '1' : '1';
    });
  });
});

	//teas end

	
	// keyvision
	window.addEventListener("load", function() {
		var images = document.querySelectorAll(".image");
		var delays = {
			"img/kv3.png": 2000,
			"img/kv4.png": 2500,
			"img/kv5.png": 3000,
			"img/kv6.png": 3500,
			"img/kv7.png": 4500,
			"img/kv9.png": 5000
		}; // 不同圖片的延遲時間（毫秒）
		
		images.forEach(function(image) { 
			var src = image.getAttribute("src");
			var delay = delays[src] || 1000; // 使用對應的延遲時間，如果未定則默認1000(毫秒)
			
			setTimeout(function() {
				image.style.opacity = "1";
				image.style.transform = "translateX(0)";
			}, delay);
		});
	});
	

  // Initialize the partner carousel
  $(document).ready(function() {
    $('.partner-carousel').owlCarousel({
      loop: true,
      margin: 30,
      nav: false,
      dots: false,
      autoplay: true,
      autoplayTimeout: 3000,
      autoplayHoverPause: true,
      responsive: {
        0: {
          items: 1
        },
        576: {
          items: 2
        },
        768: {
          items: 3
        },
        992: {
          items: 4
        }
      }
    });

    // Custom navigation
    $('.carousel-nav-prev').click(function() {
      $('.partner-carousel').trigger('prev.owl.carousel');
    });

    $('.carousel-nav-next').click(function() {
      $('.partner-carousel').trigger('next.owl.carousel');
    });
  });


	
	
	// Project carousel
    $(".project-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        loop: true,
        center: true,
        dots: false,
        nav: true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ],
        responsive: {
			0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0:{
                items:1
            },
			576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });
})(jQuery);

 var questions = [
      {
        question: "紅茶的一生",
        image: "https://i.pinimg.com/564x/13/41/4e/13414ef5d0a0c2e204cae524fc3249b3.jpg"
      },
      {
        question: "綠茶的一生",
        image: "https://creatrip.s3.ap-northeast-2.amazonaws.com/proxy/request_merchandise_guide/jm6262qmwgj8dn5uwl4x70a5ut0xpt5c.png"
      },{
        question: "白茶的一生",
        image: "https://creatrip.s3.ap-northeast-2.amazonaws.com/proxy/request_merchandise_guide/jm6262qmwgj8dn5uwl4x70a5ut0xpt5c.png"
      },{
        question: "烏龍茶的一生",
        image: " "
      },
      // 添加更多問題
    ];

    var currentQuestion = 0;

function displayQuestion() {
	var questionContainer = document.getElementById('question');
	questionContainer.textContent = questions[currentQuestion].question;
	
	var imageContainer = document.getElementById('image-containerlife');
	var image = document.getElementById('imagelife');
      image.src = questions[currentQuestion].image;
    }
function goForward() {
	currentQuestion = (currentQuestion + 1) % questions.length;
	displayQuestion();
}

function goBack() {
	currentQuestion = (currentQuestion - 1 + questions.length) % questions.length;
	displayQuestion();
}

    // 顯示第一個問題
    displayQuestion();



const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

