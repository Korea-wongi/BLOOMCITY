<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="/pack/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/pack/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/pack/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/pack/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/pack/css/main.css" rel="stylesheet" media="all">
    
</head>

<body>
    <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">여행 목적지 정보 입력</h2>
                    <form method="POST" action="/destinations">
                    	
                    	<!-- Destination 정보 입력 -->
                    	<!-- Destination_name 목적지 이름 -->
                    	<div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                            	목적지명:
                                <select name="destinationName" required>
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
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        
                        <!-- Country, 국가 -->
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                            	국가:
                                <select name="country" required>
                                    <option value="대한민국">대한민국</option>
									<option value="일본">일본</option>
									<option value="태국">태국</option>
									<option value="싱가포르">싱가포르</option>
									<option value="말레이시아">말레이시아</option>
									<option value="인도네시아">인도네시아</option>
									<option value="베트남">베트남</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                       
                        <!-- Destination 설명 -->
                        <div class="input-group">
                            <input class="input--style-2" type="text" placeholder=description name="destinationDescription" required>
                        </div>
                        
                         <!-- Destination 별칭 -->
                        <div class="input-group">
                            <input class="input--style-2" type="text" placeholder="여행지 이름 예쁘게 쓰세요" name="destinationAlias" required>
                        </div>
                        <!-- Destination END -->
                        
                         <div class="p-t-30">
                            <button class="btn btn--radius btn--green" type="submit">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="/pack/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/pack/vendor/select2/select2.min.js"></script>
    <script src="/pack/vendor/datepicker/moment.min.js"></script>
    <script src="/pack/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/pack/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>