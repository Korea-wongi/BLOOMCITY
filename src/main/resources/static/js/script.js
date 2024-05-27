// bloomcity-N3 [DNlvn6jM1v]
(function() {
  $(function() {
    $(".bloomcity-N3").each(function() {
      const $block = $(this);
      // Visual Swiper
      const visualSwiper = new Swiper(".bloomcity-N3 .visual-swiper", {
        speed: 600,
        parallax: true,
        loop: true,
        allowTouchMove: false,
        touchEventsTarget: "wrapper",
        slidesPerView: "auto",
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        navigation: {
          nextEl: ".bloomcity-N3 .visual-swiper .button-next",
          prevEl: ".bloomcity-N3 .visual-swiper .button-prev",
        },
        pagination: {
          el: ".bloomcity-N3 .visual-swiper .pagination_fraction",
          type: "fraction",
          formatFractionCurrent: function(number) {
            return ("0" + number).slice(-2);
          },
          formatFractionTotal: function(number) {
            return ("0" + number).slice(-2);
          },
          renderFraction: function(currentClass, totalClass) {
            return ('<span class="' + currentClass + '"></span>' + '<span class="' + totalClass + '"></span>');
          },
        },
      });
      // Visual Swiper Stop, Play Event
      $block.find(".stop-btn").on("click", function() {
        const $this = $(this);
        $this.toggleClass("stop");
        if ($this.hasClass("stop")) {
          visualSwiper.autoplay.stop();
          $this.find(".pause").css({
            display: "none"
          });
          $this.find(".play").css({
            display: "block"
          });
          setTimeout(function() {
            visualSwiper.autoplay.start();
            $block.find(".stop-btn .pause").css({
              display: "block"
            });
            $block.find(".stop-btn .play").css({
              display: "none"
            });
          }, 18000);
        } else {
          visualSwiper.autoplay.start();
          $this.find(".pause").css({
            display: "block"
          });
          $this.find(".play").css({
            display: "none"
          });
        }
      });
    });
  });
})();
// bloomcity-N4 [rPLvn6Jm7f]
(function() {
  $(function() {
    $(".bloomcity-N4").each(function() {
      const $block = $(this);
      // Visual Swiper
      const aboutSwiper = new Swiper(".bloomcity-N4 .about-slide", {
        speed: 600,
        parallax: true,
        loop: true,
        allowTouchMove: false,
        touchEventsTarget: "wrapper",
        slidesPerView: "auto",
        autoplay: {
          delay: 3000,
          disableOnInteraction: false,
        },
        navigation: {
          nextEl: ".bloomcity-N4 .about-slide-control .button-next",
          prevEl: ".bloomcity-N4 .about-slide-control .button-prev",
        },
        pagination: {
          el: ".bloomcity-N4 .about-slide-control .pagination_fraction",
          type: "fraction",
          formatFractionCurrent: function(number) {
            return ("0" + number).slice(-2);
          },
          formatFractionTotal: function(number) {
            return ("0" + number).slice(-2);
          },
          renderFraction: function(currentClass, totalClass) {
            return ('<span class="' + currentClass + '"></span>' + "/" + '<span class="' + totalClass + '"></span>');
          },
        },
        on: {
          init: function() {
            $(".bloomcity-N4 .progress-bar").addClass("active");
          },
          slideChangeTransitionEnd: function() {
            $(".bloomcity-N4 .progress-bar").addClass("active");
          },
          slideChangeTransitionStart: function() {
            $(".bloomcity-N4 .progress-bar").removeClass("active");
          },
        },
      });
      // Visual Swiper Stop, Play Event
      $block.find(".stop-btn").on("click", function() {
        $(this).toggleClass("stop");
        if ($(this).hasClass("stop")) {
          aboutSwiper.autoplay.stop();
          setTimeout(function() {
            visualSwiper.autoplay.start();
          }, 18000);
        } else {
          aboutSwiper.autoplay.start();
        }
      });
    });
  });
})();
// bloomcity-N5 [awLVn6jMfv]
(function() {
  $(function() {
    $(".bloomcity-N5").each(function() {
      const $block = $(this);
      // Visual Swiper
      const swiper = new Swiper(".bloomcity-N5 .content-slider", {
        loop: "true",
        initialSlide: 1,
        allowTouchMove: false,
        touchEventsTarget: "wrapper",
        observer: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".bloomcity-N5 .swiper-pagination",
          type: "progressbar",
        },
        breakpoints: {
          260: {
            slidesPerView: 1.22,
            spaceBetween: 20,
            centeredSlides: true,
          },
          768: {
            slidesPerView: 2.5,
            spaceBetween: 20,
          },
          1024: {
            slidesPerView: 2.9,
            spaceBetween: 20,
          },
          1367: {
            slidesPerView: 3.457,
            spaceBetween: 30,
          },
        },
      });
    });
  });
})();
// bloomcity-N9 [iklvN6od25]
(function() {
  $(function() {
    $(".bloomcity-N9").each(function() {
      const $block = $(this);
      const $calendar = $block.find(".contents-date");
      const weekday = new Array(7);
      weekday[0] = "일";
      weekday[1] = "월";
      weekday[2] = "화";
      weekday[3] = "수";
      weekday[4] = "목";
      weekday[5] = "금";
      weekday[6] = "토";
      // Date Range Picker
      $calendar.dateRangePicker({
        locale: {
          format: "YYYY-MM-DD",
        },
        container: ".bloomcity-N9 .calendar-wrap",
        language: "custom",
        inline: true,
        alwaysOpen: true,
        stickyMonths: true,
        hoveringTooltip: false,
        extraClass: "date-range-picker19",
        SingleMonth: "false",
        separator: " to ",
        getValue: function() {
          if ($(".date-range200").val() && $(".date-range201").val()) return ($(".date-range200").val() + " to " + $(".date-range201").val());
          else return "";
        },
        setValue: function(s, s1, s2) {
          let first = new Date(s1).getDay();
          let last = new Date(s2).getDay();
          console.log(first);
          $(".date-range200").val(s1.replaceAll("-", ".") + weekday[first]);
          $(".date-range201").val(s2.replaceAll("-", ".") + weekday[last]);
        },
        customArrowPrevSymbol: '<i class="icon icon-arrow-left"></i>',
        customArrowNextSymbol: '<i class="icon icon-arrow-right"></i>',
      }).bind("datepicker-first-date-selected", function(event, obj) {
        console.log(obj);
        if ($(".last-date-selected") && !$(".first-date-selected")) {
          setTimeout(function() {
            $(".first-date-selected").parent().addClass("first");
          }, 10);
        } else {
          $("td").removeClass();
        }
      }).bind("datepicker-change", function(event, obj) {
        console.log(obj);
        $(".first-date-selected").parent().addClass("first");
        setTimeout(function() {
          if (!$(".last-date-selected").parent().addClass("last")) {
            $(".last-date-selected").parent().addClass("last");
          } else if ($(".last-date-selected").parent().addClass("last")) {
            $(".first-date-selected").parent().addClass("first");
          }
        }, 10);
      });
      // Amount Count Button Click Event
      $block.find(".contents-amount").each(function() {
        const $this = $(this);
        const $amountNumElement = $this.find(".contents-amount-num span");
        $this.on("click", ".btn-minus", function() {
          let amountNum = parseInt($amountNumElement.text());
          if (amountNum > 1) {
            amountNum--;
          }
          $amountNumElement.text(amountNum);
        });
        $this.on("click", ".btn-plus", function() {
          let amountNum = parseInt($amountNumElement.text());
          amountNum++;
          $amountNumElement.text(amountNum);
        });
      });
    });
  });
})();