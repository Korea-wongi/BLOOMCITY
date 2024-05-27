<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

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

    <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">일차 별 상세 일정 입력</h2>
                    <form method="POST" action="/packages/${packId}" enctype="multipart/form-data">
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
                            <button class="btn btn--radius btn--green" type="submit">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="/pack/vendor/jquery/jquery.min.js"></script>
    <script src="/pack/vendor/select2/select2.min.js"></script>
    <script src="/pack/vendor/datepicker/moment.min.js"></script>
    <script src="/pack/vendor/datepicker/daterangepicker.js"></script>
    <script src="/pack/js/global.js"></script>

</body>
</html>
