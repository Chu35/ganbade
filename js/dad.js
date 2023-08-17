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