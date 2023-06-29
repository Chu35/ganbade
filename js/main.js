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

  filterOptions.forEach(option => {
    option.addEventListener('click', () => {
      const category = option.getAttribute('data-category');

      // 顯示與選擇分類相符的圖片
      teaItems.forEach(item => {
        const itemCategory = item.getAttribute('data-category');
        if (category === itemCategory || category === '全部') {
          item.style.display = 'block';
        } else {
          item.style.display = 'none';
        }
      });
    });
  });
    // 获取所有具有 .item 类的元素
    const items = document.querySelectorAll('.item');

    // 添加点击事件监听器
    items.forEach(function(item) {
      item.addEventListener('click', function() {
        // 移除所有元素的活动状态
        items.forEach(function(item) {
          item.classList.remove('active');
        });

        // 将当前点击的元素设置为活动状态
        item.classList.add('active');
      });
    });
	//teas end
	
	// keyvision
	window.addEventListener("load", function() {
  var images = document.querySelectorAll(".image");

  images.forEach(function(image, index) {
    setTimeout(function() {
      image.style.opacity = "1";
      image.style.transform = "translateX(0)";
    }, 1000 + (index * 500));
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


})(jQuery);

