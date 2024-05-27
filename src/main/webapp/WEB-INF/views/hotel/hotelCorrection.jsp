<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Registration Form</title>
    <link rel="stylesheet" href="/css/hotelRegister.css">
    <script>
		function validateForm() {
		    // 호텔 편의시설 검사
		    const amenities = document.querySelectorAll('input[name="amenities"]:checked');
		    if (amenities.length === 0) {
		        alert('적어도 하나 이상의 호텔 편의시설을 선택해야 합니다.');
		        return false; // 폼 제출을 막습니다.
		    }
		
		    // 호텔 이미지 검사
		    const hotelImageInput = document.getElementById('hotelImage');
		    if (hotelImageInput.files.length === 0) {
		        alert('호텔 이미지를 업로드해야 합니다.');
		        return false;
		    }
			
		    alert("등록 완료");
		    return true;
		}
		
	</script>
</head>
<body>
<div class="abc">
    <form id="hotelRegistrationForm" action="/hotels/${hotelData.hotelId}" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
        <h1>호텔 등록 페이지</h1>
        <label for="hotelName">호텔 이름:</label>
        <input type="text" id="hotelName" name="hotelName" value="${hotelData.hotelName}"/>

        <label for="destinationName">호텔 위치:</label>
        <select id="destinationName" name="destinationName">
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

        <label for="starRating">Hotel Stars:</label>
        <select id="starRating" name="starRating">
            <option value="1">1 Star</option>
            <option value="2">2 Stars</option>
            <option value="3">3 Stars</option>
            <option value="4">4 Stars</option>
            <option value="5">5 Stars</option>
        </select>

        <label for="description">호텔 설명:</label>
        <textarea id="description" name="description" >${hotelData.description}</textarea>

         <label for="hotelImage">호텔 이미지:</label> 
         <input type="file" id="hotelImage" name="hotelImage" accept="image/*" multiple >
		<input type="hidden" id="hotelImg">

		 <!--  넘어온 checkbox 확인 --> 
       <c:if test="${not empty list}">
		    <c:forEach items="${list}" var="amenity">
		        <input type="hidden" class="amenitieshidden" name="amenitieshidden" value="${amenity.getAmenity()}">
		    </c:forEach>
		</c:if>


     <fieldset>
            <legend>호텔 편의시설</legend> 
            <label><input type="checkbox" name="amenities" value="Free WiFi">Free WiFi</label>
            <label><input type="checkbox" name="amenities" value="Parking">Parking</label>
            <label><input type="checkbox" name="amenities" value="Pool">Pool</label>
            <label><input type="checkbox" name="amenities" value="Gym">Gym</label>
            <label><input type="checkbox" name="amenities" value="Spa">Spa</label>
        </fieldset>

		
   

        <button type="submit">Submit</button>
    </form>
   </div>
   
</body>

<script type="text/javascript">
//호텔의 위치를 가져와서 선택해서 보여줌
var selectedValue = "${hotelData.destinationName}";
var destinationSelect = document.getElementById('destinationName');
for (var i = 0; i < destinationSelect.options.length; i++) {
  if (destinationSelect.options[i].value === selectedValue) {
	        destinationSelect.options[i].selected = true;
      break;
  }
}

//호텔이 몇성급호텔인지
var selectedStarRating = "${hotelData.starRating}"; 
var starRatingSelect = document.getElementById('starRating');
for (var i = 0; i < starRatingSelect.options.length; i++) {
  if (starRatingSelect.options[i].value === selectedStarRating) {
	        starRatingSelect.options[i].selected = true;
  		    break;
  }
}


//input 태그 중 타입이 checkbox인 요소들을 선택합니다.
var checkboxes = document.querySelectorAll('input[type="checkbox"]');
var DBcheckboxes = document.querySelectorAll('.amenitieshidden');

//DBcheckboxes가 비어 있는지 확인합니다.
if(DBcheckboxes.length > 0){
  for(var j = 0 ; j < DBcheckboxes.length ; j++){
  	
      var DbCheckbox = DBcheckboxes[j];
      var isChecked = false; // 체크된 상태를 나타내는 변수를 추가합니다.
      
	        for(var a = 0; a < checkboxes.length ; a++){
	        	
	            var checkbox = checkboxes[a];
	            // DBcheckboxes와 checkboxes를 비교하여 체크박스의 상태를 설정합니다.
	            if(DbCheckbox.value === checkbox.value){
	            	
	                this.checkbox.checked = true;
	                isChecked = true; // 체크된 상태를 표시합니다.
	                break;
	            }
	        }
   	  // 모든 체크박스를 확인했는데도 일치하는 것이 없다면 체크되지 않은 상태로 처리합니다.
	        if(!isChecked){
	            this.DbCheckbox.checked = false;
	        }
  }
}



</script>

</html>
