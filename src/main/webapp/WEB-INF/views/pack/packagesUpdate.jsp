<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    <title>Au Register Forms by Colorlib</title>
    <link href="/pack/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/pack/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <link href="/pack/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/pack/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link href="/pack/css/main1.css" rel="stylesheet" media="all">
    <style type="text/css">
      .styled-table {
        width: 100%;
        border-collapse: collapse;
      }
      .styled-table th, .styled-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      .styled-table th {
        background-color: #f2f2f2;
      }
       .info-header {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .btn-toggle {
            width: 100%;
            text-align: left;
            padding: 10px;
            font-size: 1.2rem;
            color: #007bff;
            background-color: #e9ecef;
            border-color: #007bff;
        }
        .detail-item {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        .detail-image {
            width: 100%;
            height: auto;
            border-radius: 5px;
            margin-top: 10px;
        }
        .content-area {
            display: flex;
        }
        .main-content {
            flex: 1;
        }
        .side-bar {
            width: 200px; /* Adjust the width as needed */
            padding-left: 20px;
        }
        .booking-button, .person-select {
            display: block;
            
    </style>
    <script type="text/javascript">
        function setHotelField(hotelId, index) {
            document.getElementById('hotel_' + index).value = hotelId;
        }
        
        function setRestaurantField(restaurantId, index) {
        	var inputField = document.getElementById('restaurant_' + index);
            var currentValue = inputField.value;
            if (document.querySelector('input[name="restaurantId_' + index + '"][value="' + restaurantId + '"]').checked) {
                // 체크된 경우, ID 추가
                if (!currentValue.includes(restaurantId + " ")) { // ID가 이미 있지 않은 경우에만 추가
                    inputField.value += restaurantId + " ";
                }
            } else {
                // 체크 해제된 경우, ID 제거
                inputField.value = currentValue.replace(restaurantId + " ", ""); // 해당 ID를 빈 문자열로 대체
            }
        }
        
        function setTouristField(attractionId, index) {
        	var inputField = document.getElementById('Tourist_' + index);
            var currentValue = inputField.value;
            if (document.querySelector('input[name="TouristId_' + index + '"][value="' + attractionId + '"]').checked) {
                // 체크된 경우, ID 추가
                if (!currentValue.includes(attractionId + " ")) { // ID가 이미 있지 않은 경우에만 추가
                    inputField.value += attractionId + " ";
                }
            } else {
                // 체크 해제된 경우, ID 제거
                inputField.value = currentValue.replace(attractionId + " ", ""); // 해당 ID를 빈 문자열로 대체
            }
        }
        
        function setActivityField(attractionId, index) {
        	var inputField = document.getElementById('Activity_' + index);
            var currentValue = inputField.value;
            if (document.querySelector('input[name="ActivityId_' + index + '"][value="' + attractionId + '"]').checked) {
                // 체크된 경우, ID 추가
                if (!currentValue.includes(attractionId + " ")) { // ID가 이미 있지 않은 경우에만 추가
                    inputField.value += attractionId + " ";
                }
            } else {
                // 체크 해제된 경우, ID 제거
                inputField.value = currentValue.replace(attractionId + " ", ""); // 해당 ID를 빈 문자열로 대체
            }
        }
    </script>
</head>

<body>

  <!-- [E]bloomcity-N1 -->
  <main class="th-layout-main ">
    <!-- [S]bloomcity-N9 -->
    <div class="bloomcity-N9" data-bid="LDLvM1Xg5K">
      <div class="content-container">
        <div class="container-md">
          <div class="con-tit textset">
            <h2 class="textset-tit ff-po">Package Update Page</h2>
          </div>
          <div class="content-group">
            <div class="form-wrap">
              
              	<div class="input-group">
                      <label class="label"><h3>패키지 명</h3></label>
                      <div class="inputset inputset-lg">
                        <input type="text" value="${pack.packName }" class="inputset-input form-control" placeholder="패키지 명을 입력하세요." name="packName" required>
                      </div>
                </div>
                
                <div class="input-group">
                      <label class="label"><h3>Destinaton 별칭</h3></label>
                      <div class="inputset inputset-lg">
                        <input type="text" value="${pack.destinationAlias }" class="inputset-input form-control" placeholder="목적지 별칭을 입력하세요." name="destinationAlias" required>
                      </div>
                </div>
                    
                <div class="form-body">
                  <div class="calendar-wrap"></div>
                  <fieldset class="fieldset pc-form">
                  
                    <div class="input-group">
                      <label class="label" for="CheckIN-pc">체크인</label>
                      <div class="inputset inputset-lg">
                        <input id="CheckIN-pc" value="${sDate }" type="text" name="sDate" class="date-range200 inputset-input form-control" value="" required="required">
                        <figure class="icon">
                          <img src="/icons/icon_calendar.svg" alt="아이콘">
                        </figure>
                      </div>
                    </div>
                    
                    <div class="input-group">
                      <label class="label" for="CheckOut-pc"></label>체크아웃 <div class="inputset inputset-lg">
                        <input id="CheckOut-pc" value="${eDate }" type="text" name="eDate" class="date-range201 inputset-input form-control" value="" required="required">
                        <figure class="icon">
                          <img src="/icons/icon_calendar.svg" alt="아이콘">
                        </figure>
                      </div>
                    </div>
                    
                    
                     <div class="input-group">
                      <label class="label">패키지 지역</label>
                      <div class="inputset inputset-lg">
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_minus_black.svg" alt="-"> -->
                        </button>
	                       <select class="form-select form-select-lg mb-3" name="destinationName" aria-label="Large select example">
							 	<option value="KOREA-ICN">인천(ICN)</option>
							    <option value="JAPAN-NRT">도쿄(NRT)</option>
							    <option value="JAPAN-HND">하네다(HND)</option>
							    <option value="JAPAN-KIX">오사카(KIX)</option>
							    <option value="JAPAN-CTS">삿포로(CTS)</option>
							    <option value="EASTSOUTHASIA-BKK">방콕(BKK)</option>
							    <option value="EASTSOUTHASIA-SIN">싱가포르(SIN)</option>
							    <option value="EASTSOUTHASIA-KUL">쿠알라룸푸르(KUL)</option>
							    <option value="EASTSOUTHASIA-CGK">자카르타(CGK)</option>
							    <option value="EASTSOUTHASIA-HAN">하노이(HAN)</option>
							</select>
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_plus_black.svg" alt="+"> -->
                        </button>
                      </div>
                    </div>
                    
                    
                     <div class="input-group">
                      <label class="label">패키지 타입</label>
                      <div class="inputset inputset-lg">
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_minus_black.svg" alt="-"> -->
                        </button>
                       <select name="packType" class="form-select form-select-lg mb-3" aria-label="Large select example">
						 	<option value="일반패키지">일반 패키지</option>
						    <option value="허니문패키지">허니문 패키지</option>
						</select>
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_plus_black.svg" alt="+"> -->
                        </button>
                      </div>
                    </div>
                    
                    <div class="input-group">
                      <label class="label">Price</label>
                      <div class="inputset inputset-lg">
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_minus_black.svg" alt="-"> -->
                        </button>
                        <input type="number" value="${pack.price }" name="price" class="inputset-input form-control" placeholder="가격을 입력하세요." required>
                        <button class="btnset" type="button">
<!--                           <img src="/icons/icon_plus_black.svg" alt="+"> -->
                        </button>
                      </div>
                    </div>
                  </fieldset>
                </div>
                
                
        
      <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">일차 별 상세 일정 수정</h2>
                    <h4>현재 등록된 일정</h4>
                    <br>
           <div id="accordion">
            <c:forEach var="entry" items="${map}">
                <div class="card">
                    <div class="card-header" id="heading${entry.key}">
                        <h2 class="mb-0">
                            <button class="btn btn-toggle" type="button" data-toggle="collapse" data-target="#collapse${entry.key}" aria-expanded="true" aria-controls="collapse${entry.key}">
                                Day ${entry.key}
                            </button>
                        </h2>
                    </div>
                    <div id="collapse${entry.key}" class="collapse" aria-labelledby="heading${entry.key}" data-parent="#accordion">
                        <div class="card-body">
                            <c:forEach var="itemWrapper" items="${entry.value}">
                                <div class="detail-item">
                                    <c:choose>
                                        <c:when test="${itemWrapper.type == 'hotel'}">
                                            <strong>Hotel:</strong> ${itemWrapper.item.hotelName} - ${itemWrapper.item.destinationName}
                                        </c:when>
                                        <c:when test="${itemWrapper.type == 'hotelAmenities'}">
                                            <strong>Hotel Amenities:</strong> ${itemWrapper.item.amenity}
                                        </c:when>
                                        <c:when test="${itemWrapper.type == 'hotelImages'}">
                                            <img src="${itemWrapper.item.imgName}" alt="${itemWrapper.item.imgName}" class="detail-image">
                                        </c:when>
                                        <c:when test="${itemWrapper.type == 'attraction'}">
                                            <strong>Attraction:</strong> ${itemWrapper.item.attractionName} - ${itemWrapper.item.attractionDescription}
                                        </c:when>
                                        <c:when test="${itemWrapper.type == 'restaurant'}">
                                            <strong>Restaurant:</strong> ${itemWrapper.item.restaurantName} - ${itemWrapper.item.restaurantDescription}
                                        </c:when>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
                    
                    
                    <br><br>
                    <h3>일정을 수정하세요. 전체 수정 됩니다.</h3>
                    <br>
           		<form action="/packages/${pack.packId}" enctype="multipart/form-data" method="post">
    				<input type="hidden" name="_method" value="PUT">
                    <input type="hidden" value="${pack.packName }"  name="packName">
                    <input type="hidden" value="${pack.destinationName }" name="destinationName">
                    <input type="hidden" value="${pack.packType }" name="packType">
                    <input type="hidden" value="${pack.startDate }" name="stDate">
                    <input type="hidden" value="${pack.endDate }" name="enDate">
                    <input type="hidden" value="${pack.price }" name="price">
                    <input type="hidden" value="${pack.destinationAlias }" name="destinationAlias">
                    
                        <c:forEach var="i" begin="1" end="${daysDifference}">
                        <input type="hidden" name="days" value="${daysDifference}">
                        	<h4>${i} 일차 일정</h4>
                        	호텔:
                        	<input type="text" id="hotel_${i}" name="hotel[${i }]" value="" >
                            <div class="input-group">
                                <table class="styled-table">
						            <thead>
						                <tr>
						                    <th>Select</th>
						                    <th>Hotel Name</th>
						                    <th>Destination Name</th>
						                    <th>Star Rating</th>
						                    <th>Description</dt>
						                    <th>Hotel Amenities</dt>
						                    <th>Hotel Img</dt>
						                </tr>
						            </thead>
						            <tbody>
						                <c:forEach var="item" items="${hotelView}">
						                    <tr>
						                        <td> 
						                        	<input type="radio" name="hotelId_${i}" value="${item.hotelId}" onclick="setHotelField('${item.hotelId}', ${i})">
						                        </td>
						                        <td>${item.hotelName}</td>
						                        <td>${item.destinationName}</td>
						                        <td>${item.starRating}</dt>
						                        <td>${item.description}</dt>
						                        <td>${item.hotelAmenities}</dt>
						                        <td>${item.hotelImages}</dt>
						                    </tr>
						                </c:forEach>
						            </tbody>
						        </table>
                            </div>

							식당:
							<input type="text" id="restaurant_${i}" name="restaurant[${i}]" value="" >
                            <div class="input-group">
                            	<table class="styled-table">
						            <thead>
						                <tr>
						                    <th>Select</th>
						                    <th>Restaurant Name</th>
						                    <th>Destination Name</dt>
						                    <th>Restaurant Cuisine</th>
						                    <th>Restaurant Description</th>
						                    
						                </tr>
						            </thead>
						            <tbody>
						                <c:forEach var="item" items="${restaurantView}">
						                    <tr>
						                        <td> 
						                        	<input type="checkbox" name="restaurantId_${i}" value="${item.restaurantId}" onclick="setRestaurantField('${item.restaurantId}', ${i})">
						                        </td>
						                        <td>${item.restaurantName}</td>
						                        <td>${item.destinationName}</dt>
						                        <td>${item.cuisine}</td>
						                        <td>${item.restaurantDescription}</dt>
						                    </tr>
						                </c:forEach>
						            </tbody>
						        </table>
                            </div>
							
							관광지:
							<input type="text" id="Tourist_${i}" name="tourist[${i}]" value="" >
                            <div class="input-group">
                            	<table class="styled-table">
						            <thead>
						                <tr>
						                    <th>Select</th>
						                    <th>Tourist Name</th>
						                    <th>Tourist Type</dt>
						                    <th>Tourist Description</th>
						                    <th>Destination Name</th>
						                    
						                </tr>
						            </thead>
						            <tbody>
						                <c:forEach var="item" items="${attractionView}">
						                    <tr>
						                        <td> 
						                        	<input type="checkbox" name="TouristId_${i}" value="${item.attractionId}" onclick="setTouristField('${item.attractionId}', ${i})">
						                        </td>
						                        <td>${item.attractionName}</td>
						                        <td>${item.type}</dt>
						                        <td>${item.attractionDescription}</td>
						                        <td>${item.destinationName}</dt>
						                    </tr>
						                </c:forEach>
						            </tbody>
						        </table>
                            </div>
                            
                            액티비티:
                            <input type="text" id="Activity_${i}" name="activity[${i}]" value="" >
                            <div class="input-group">
                            	<table class="styled-table">
						            <thead>
						                <tr>
						                    <th>Select</th>
						                    <th>Activity Name</th>
						                    <th>Activity Type</dt>
						                    <th>Activity Description</th>
						                    <th>Destination Name</th>
						                    
						                </tr>
						            </thead>
						            <tbody>
						                <c:forEach var="item" items="${activityView}">
						                    <tr>
						                        <td> 
						                        	<input type="checkbox" name="ActivityId_${i}" value="${item.attractionId}" onclick="setActivityField('${item.attractionId}', ${i})">
						                        </td>
						                        <td>${item.attractionName}</td>
						                        <td>${item.type}</dt>
						                        <td>${item.attractionDescription}</td>
						                        <td>${item.destinationName}</dt>
						                    </tr>
						                </c:forEach>
						            </tbody>
						        </table>
                            </div>			
                            <br><br>
                        </c:forEach>
                        <div class="p-t-30">
                            <button class="btn btn--radius btn--green" type="submit">패키지 수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
                
<!--                 <div class="btn-box"> -->
<!--                   <button type="submit" class="btnset btnset-lg btnset-rect">패키지 등록하기</button> -->
<!--                 </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
   <script src="/pack/vendor/jquery/jquery.min.js"></script>
    <script src="/pack/vendor/select2/select2.min.js"></script>
    <script src="/pack/vendor/datepicker/moment.min.js"></script>
    <script src="/pack/vendor/datepicker/daterangepicker.js"></script>
    <script src="/pack/js/global.js"></script>
    
    <script>
  // 각 입력 필드 선택
  const packNameInput = document.querySelector('input[name="packName"][type="text"]');
  const destinationNameSelect = document.querySelector('select[name="destinationName"]');
  const packTypeSelect = document.querySelector('select[name="packType"]');
  const startDateInput = document.querySelector('input[name="sDate"]');
  const endDateInput = document.querySelector('input[name="eDate"]');
  const priceInput = document.querySelector('input[name="price"][type="number"]');
  const destinationAliasInput = document.querySelector('input[name="destinationAlias"]');

  // 각 숨겨진 입력 필드 선택
  const hiddenPackName = document.querySelector('input[name="packName"][type="hidden"]');
  const hiddenDestinationName = document.querySelector('input[name="destinationName"][type="hidden"]');
  const hiddenPackType = document.querySelector('input[name="packType"][type="hidden"]');
  const hiddenStartDate = document.querySelector('input[name="stDate"][type="hidden"]');
  const hiddenEndDate = document.querySelector('input[name="enDate"][type="hidden"]');
  const hiddenPrice = document.querySelector('input[name="price"][type="hidden"]');
  const hiddenDestinationAlias = document.querySelector('input[name="destinationAlias"][type="hidden"]');

  // 입력 이벤트 핸들러 함수
  function updateHiddenField(source, target) {
    source.addEventListener('input', function() {
      target.value = this.value;
    });
  }
  
  const form = document.querySelector('form'); // 폼 요소 선택

  form.addEventListener('submit', function(event) {
    hiddenStartDate.value = startDateInput.value;
    hiddenEndDate.value = endDateInput.value;
  });

  // 각 필드에 대해 이벤트 리스너 설정
  updateHiddenField(packNameInput, hiddenPackName);
  updateHiddenField(destinationNameSelect, hiddenDestinationName);
  updateHiddenField(packTypeSelect, hiddenPackType);
  updateHiddenField(priceInput, hiddenPrice);
  updateHiddenField(destinationAliasInput, hiddenDestinationAlias);

</script>
    
</body>