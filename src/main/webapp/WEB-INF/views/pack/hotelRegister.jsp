<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <form id="hotelRegistrationForm" action="/hotels" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
        <h1>호텔 등록 페이지</h1>
        <label for="hotelName">호텔 이름:</label>
        <input type="text" id="hotelName" name="hotelName" required>

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
        <textarea id="description" name="description" required></textarea>

         <label for="hotelImage">호텔 이미지:</label> 
         <input type="file" id="hotelImage" name="hotelImage" accept="image/*" multiple>

        <fieldset>
            <legend>호텔 편의시설</legend>
            <label><input type="checkbox" name="amenities" value="Free WiFi"> Free WiFi</label>
            <label><input type="checkbox" name="amenities" value="Parking"> Parking</label>
            <label><input type="checkbox" name="amenities" value="Pool"> Pool</label>
            <label><input type="checkbox" name="amenities" value="Gym"> Gym</label>
            <label><input type="checkbox" name="amenities" value="Spa"> Spa</label>
        </fieldset>

        <button type="submit">Submit</button>
    </form>
   </div>
   
</body>
</html>
