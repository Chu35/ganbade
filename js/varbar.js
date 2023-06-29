// Navbar Color
  var previousLink = null; // 儲存先前選中的連結

  // 網頁載入完成後的處理函式
  window.onload = function() {
    var currentPath = window.location.pathname; // 獲取目前的網頁路徑
    var currentLink = null;

    // 尋找與目前網頁路徑相符的導覽連結
    var navLinks = document.getElementsByClassName('nav-link');
    for (var i = 0; i < navLinks.length; i++) {
      var link = navLinks[i];
      if (link.getAttribute('href') === currentPath) {
        currentLink = link;
        break;
      }
    }

    // 如果找到相符的連結，則將其設定為活動狀態並更改顏色
    if (currentLink !== null) {
      changeColor(currentLink);
    }
  };

  function changeColor(element) {
    // 如果有先前選中的連結，將其恢復原狀
    if (previousLink !== null) {
      previousLink.classList.remove('active');
      previousLink.style.color = ''; // 恢復原來的顏色
    }

    // 將點擊的連結設定為活動狀態並更改顏色
    element.classList.add('active');
    element.style.color = '#355EFC'; // 更改為所需的顏色

    // 將當前連結設定為先前選中的連結
    previousLink = element;
  }

// TEAS
		var containerEl = document.querySelector('.search_tea_body');
		var filterizd;
		if (containerEl) {
			filterizd = $('.search_tea_body').filterizr({});
		}
		//Active changer
		$('.search_tea button').on('click', function () {
			$('.search_tea button').removeClass('active');
			$(this).addClass('active');
		});
	});


// JavaScript Document