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
                    <h2 class="title">명소 정보 입력</h2>
                    <form method="POST" action="/attractions/${id}" enctype="multipart/form-data">
                    
                     	<!-- 명소 이름 -->
                        <div class="input-group">
                            <input class="input--style-2" type="text" placeholder="Attraction_Name" name="attractionName" required>
                        </div>
                    	
                    	<!-- 명소 타입  -->
                    	<div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                            	명소 타입:
                                <select  name="type" required>
                                    <option value="Tourist Spot">관광지</option>
								    <option value="Activity">액티비티</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        
                        <!-- 명소 이미지 -->
                        <label for="attractionsImage">식당 이미지:</label> 
         				<input type="file" id="attractionsImage" name="attractionsImage" accept="image/*" multiple>
                        
                        <br><br>
                        
                        <!-- 명소 설명 -->
                        <div class="input-group">
                            <input class="input--style-2" type="text" placeholder="Attraction_Description" name="attractionDescription" required>
                        </div>
                       
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