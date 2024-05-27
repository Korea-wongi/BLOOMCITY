<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="title" content="웹사이트">
  <meta name="description" content="웹사이트입니다.">
  <meta name="keywords" content="키워드,키워드,키워드">
  <meta property="og:title" content="웹사이트">
  <meta property="og:description" content="웹사이트입니다">
  <meta property="og:image" content="https://웹사이트/images/opengraph.png">
  <meta property="og:url" content="https://웹사이트">
  <title>Reservation | aaa</title>
  <link rel="stylesheet" href="/css/setting.css">
  <link rel="stylesheet" href="/css/plugin.css">
  <link rel="stylesheet" href="/css/template.css">
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/style.css">
</head>

<body>
  <!-- [S]bloomcity-N1 -->

  <!-- [E]bloomcity-N1 -->
  <main class="th-layout-main ">
    <!-- [S]bloomcity-N9 -->
    <div class="bloomcity-N9" data-bid="LDLvM1Xg5K">
      <div class="content-container">
        <div class="container-md">
          <div class="con-tit textset">
            <h2 class="textset-tit ff-po">Reservation</h2>
            <p class="textset-desc">여행 패키지 조회</p>
          </div>
          <div class="content-group">
            <div class="form-wrap">
            
              <form action="reservationInquiry" method="get">
                <div class="form-header">
                  <h3 class="form-tit">날짜를 선택하세요.</h3>
                  <fieldset class="mobile-check">
                    <div class="input-group">
                      <label class="label" for="CheckIn-m">Start Date</label>
                      <div class="inputset inputset-lg calendar">
                        <input id="CheckIn-m"  type="text" class="date-range200 inputset-input form-control" value="">
                      </div>
                    </div>
                   
                    <div class="input-group">
                      <label class="label" for="CheckOut-m">End Date</label>
                      <div class="inputset inputset-lg calendar">
                        <input id="CheckOut-m"  type="text" class="date-range201 inputset-input form-control" value="">
                      </div>
                    </div>
                  </fieldset>
                  <div class="contents-date"></div>
                </div>
                <div class="form-body">
                  <div class="calendar-wrap"></div>
                  <fieldset class="fieldset pc-form">
                    <div class="input-group">
                      <label class="label" for="CheckIN-pc">Start Date</label>
                      <div class="inputset inputset-lg">
                        <input id="startDate" name="startDate" type="text" class="date-range200 inputset-input form-control" value="" >
                        <figure class="icon">
                          <img src="/icons/icon_calendar.svg" alt="아이콘">
                        </figure>
                      </div>
                    </div>
                    <div class="input-group">
                      <label class="label" for="CheckOut-pc"></label>End Date<div class="inputset inputset-lg">
                        <input id="endDate" name="endDate" type="text" class="date-range201 inputset-input form-control" value=""  >
                        <figure class="icon">
                          <img src="icons/icon_calendar.svg" alt="아이콘">
                        </figure>
                      </div>
                    </div>
        
                  <div class="input-group">
        <label class="label">personnel</label>
        <div class="inputset inputset-lg">
            <button class="btnset" type="button" id="minus1">
                <img src="icons/icon_minus_black.svg" alt="-" onclick="decreaseQuantity('quantityInput1')">
            </button>
            <input type="text" name="numberOfPeople" class="inputset-input form-control" id="quantityInput1" value="1" readonly>
            <button class="btnset" type="button" id="plus1">
                <img src="icons/icon_plus_black.svg" alt="+" onclick="increaseQuantity('quantityInput1')">
            </button>
        </div>
    </div>
                  
                  </fieldset>
                <fieldset class="fieldset mobile-form">
    <div class="input-group">
        <label class="label">personnel</label>
        <div class="inputset inputset-lg d-flex justify-content-between">
            <button class="btnset btnset-rect" type="button" id="minus2">
                <img src="icons/icon_minus_black.svg" alt="-" onclick="decreaseQuantity('quantityInput2')">
            </button>
            <input type="text" class="inputset-input form-control" id="quantityInput2" value="1" readonly>
            <button class="btnset btnset-rect" type="button" id="plus2">
                <img src="icons/icon_plus_black.svg" alt="+" onclick="increaseQuantity('quantityInput2')">
            </button>
        </div>
    </div>
</fieldset>

  
                </div>
                <div class="btn-box">
                <button type="submit">
                  <p class="btnset btnset-line btnset-lg btnset-rect">패키지 조회하기</p>
                </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]bloomcity-N9 -->
  </main>
  <!-- [S]bloomcity-N2 -->
  <script src="/js/setting.js"></script>
  <script src="/js/plugin.js"></script>
  <script src="/js/template.js"></script>
  <script src="/js/common.js"></script>
  <script src="/js/script.js"></script>
  <script type="text/javascript">
  function increaseQuantity(inputId) {
      var input = document.getElementById(inputId);
      var value = parseInt(input.value);
      input.value = value + 1;
  }

  function decreaseQuantity(inputId) {
      var input = document.getElementById(inputId);
      var value = parseInt(input.value);
      if (value > 1) {
          input.value = value - 1;
      }
  }
  </script>
  
</body>

</html>
  
