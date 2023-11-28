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
    $(document).ready(function () {
      let lastScrollTop = 0;
      let navbar = $('.fixed-top');
      let navItems = $('.navbar .nav-item');
      let navLinks = $('.navbar .nav-link');
  
      $(window).scroll(function () {
          let currentScrollTop = $(this).scrollTop();
  
          if (currentScrollTop > lastScrollTop) {
              // 用户向下滚动
              navbar.removeClass('bg-white shadow').css('top', -45);
              navItems.css('display', 'none');
              navLinks.css('padding', '0');
          } else {
              // 用户向上滚动
              if ($(window).width() < 992) {
                  navbar.addClass('bg-white shadow');
              } else {
                  navbar.addClass('bg-white shadow').css('top', 0);
              }
              navItems.css('display', 'block');
              navLinks.css('padding', '25px 15px');
          }
  
          // 检查是否滚动到顶部
          if (currentScrollTop === 0) {
              navbar.removeClass('bg-white shadow');
          }
  
          lastScrollTop = currentScrollTop;
      });
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
	
	
  //teas select
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
});//teas end

// keyvision
window.addEventListener("load", function() {
  var images = document.querySelectorAll(".image");
  var delays = {
    "img/kv3.png": 1500,
    "img/kv4.png": 1500,
    "img/kv5.png": 1500,
    "img/kv7.png": 2500,	
    "img/kv9.png": 2500
  }; // 不同圖片的延遲時間（毫秒）
  
  images.forEach(function(image) { 
    var src = image.getAttribute("src");
    var delay = delays[src] || 1000; 
    
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

  //teas select
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
});//teas end
 
//fun pin
function jumpIcon(pin) {
  pin.classList.add('jump');
  setTimeout(() => {
    pin.classList.remove('jump');
    setTimeout(() => {
      const targetId = pin.getAttribute('data-target');
      const targetElement = document.getElementById(targetId);

      if (targetElement) {
        const targetRect = targetElement.getBoundingClientRect();
        const middleY = targetRect.top + targetRect.height / 2;
        const scrollY = middleY - window.innerHeight / 2;
        window.scrollTo({
          top: scrollY,
          behavior: 'smooth',
        });
      }
    }, 400); // 等待1秒再执行跳转，单位是毫秒
  }, 200); // 调整时间以控制跳动速度，单位是毫秒
}


//瀏覽人數
if (typeof (Storage) !== "undefined") {
  if (localStorage.pagecount) {
      localStorage.pagecount = Number(localStorage.pagecount) + 1;
  } else {
      localStorage.pagecount = 1;
  }
  document.getElementById("count").innerHTML = "網站瀏覽人數：" + localStorage.pagecount;
} else {
  document.getElementById("count").innerHTML = "Sorry";
}

//store list
    function toggleSubcategory(subcategoryID) {
        var subcategory = document.getElementById(subcategoryID);
        if (subcategory.style.display === 'none') {
            subcategory.style.display = 'block';
        } else {
            subcategory.style.display = 'none';
        }
    }
