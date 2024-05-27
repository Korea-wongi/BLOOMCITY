<%@page import="travel.project.service.customer.CustomerService"%>
<%@page import="travel.project.domain.Customer"%>
<%@page import="travel.project.domain.Pack"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="pack" value="${requestScope.pack}" />

<%
	String id = (String)session.getAttribute("id");
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>여행 패키지 상세 정보</title>
    <!-- Bootstrap CSS -->
    <style>
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
            margin-bottom: 10px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- iamport.payment.js -->
	<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	 
	 <script type="text/javascript">
        const date = new Date();
        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        const dateStr = `${year}-${month}-${day}`;
        let currentDate = new Date(); // 현재 날짜와 시간을 나타내는 객체 생성
        
        var IMP = window.IMP;
        IMP.init("imp32507106");
        
        function requestPay() {
            
            IMP.request_pay({
                pg: "html5_inicis.INIpayTest",       // KG이니시스 pg파라미터 값
                pay_method: "card",       // 결제 방법
                merchant_uid: createOrderNum(), // 주문번호
                name: '${pack.packName}',      // 상품 명
                amount: ${pack.price} * $("#numOfPeople").val(),              // 금액
                buyer_email: '${customer.email}',
                buyer_name: '${customer.name}',
                buyer_tel: '${customer.phoneNumber}',
                buyer_addr: '${customer.address}',
//                buyer_postcode: "01181"
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    alert(msg);
                 // 결제 DTO 생성
                    makePaymentDTO(rsp); 
                 // 결제 완료 후 form을 submit
                    document.getElementById("payment_success_form").submit();
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                }
            });
        }

        function createOrderNum() {
            // 주문번호를 현재 시간을 이용하여 생성
            return "IMP" + Date.now();
        }
    
    
    	function makePaymentDTO(rsp) {
        	// 결제 완료 후, 결제 DTO 생성
        	let payment_code = $('<input>', {
                type: 'hidden',
                name: 'paymentId',
                value: rsp.merchant_uid
            });
        	
        	let price = $('<input>', {
                type: 'hidden',
                name: 'price',
                value: rsp.amount
            });
        	
        	let people = $('<input>', {
                type: 'hidden',
                name: 'numberOfPeople',
                value: $("#numOfPeople").val()
            });
        	
        	let date = $('<input>', {
                type: 'hidden',
                name: 'reservationDate',
                value: currentDate.toISOString().slice(0, 10)
            });
        	
        	// Form에 생성한 input 태그들 추가
            $('#payment_success_form').append(payment_code);
            $('#payment_success_form').append(price);
            $('#payment_success_form').append(people);
            $('#payment_success_form').append(date);
    	}
    </script>
</head>
<body>

<div class="container content-area">
    <div class="main-content">
        <div class="info-header">
            <h1 class="h3">여행지: ${pack.destinationAlias}</h1>
            <p>출발일: ${pack.startDate} | 도착일: ${pack.endDate} | 가격: ${pack.price}원</p>
            <c:forEach var="image" items="${imageList}">
                <img src="/images/${image.imgName}" alt="${image.imgName}">
            </c:forEach>
        </div>
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
    </div>
    <div class="side-bar">
        <button class="btn btn-primary booking-button" onclick="requestPay()">
            예약하기
        </button>
        
        <!-- <a href="javascript:requestPay()">예약하기</a> -->
        <select class="person-select form-control" id="numOfPeople">
            <option value="1">1인</option>
            <option value="2">2인</option>
            <option value="3">3인</option>
            <option value="4">4인</option>
            <option value="5">5인</option>
        </select>
    </div>
</div>

<form action="/Pay/payConfirm" id="payment_success_form">
		<!-- 결제 완료 후 정보 삽입 -->
		<input type="hidden" name="packId" id="packId" value="${pack.packId}">
		<input type="hidden" name="customerId" id="customerId" value="${customer.customerId}">
</form>

<script type="text/javascript">
	console.log("packId: " , document.getElementById("packId"));
	console.log("customerId: " , document.getElementById("customerId"));
</script>
</body>
</html>
