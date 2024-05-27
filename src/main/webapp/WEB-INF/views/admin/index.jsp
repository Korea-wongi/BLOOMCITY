<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 화면</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="/admin/css/styles.css" rel="stylesheet" />
<style type="text/css">

table caption {
	padding: .5em 0;
}

table.dataTable th, table.dataTable td {
	white-space: nowrap;
}

.p {
	text-align: center;
	padding-top: 140px;
	font-size: 14px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/admin">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<!-- <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul> -->
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Membership</div>
						<a class="nav-link" href="admin/membership">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원관리
						</a>
						<div class="sb-sidenav-menu-heading">Travel Package</div>
<%-- 						<a class="nav-link collapsed" href="<%=contextPath %>/admin/reservation" > --%>
<!-- 							<div class="sb-nav-link-icon"> -->
<!-- 								<i class="fas fa-columns"></i> -->
<!-- 							</div> 예약관리 -->
<!-- 						</a> -->
<%-- 						<a class="nav-link collapsed" href="<%=contextPath %>/admin/travelpackage"> --%>
<!-- 							<div class="sb-nav-link-icon"> -->
<!-- 								<i class="fas fa-book-open"></i> -->
<!-- 							</div> 여행상품 관리 -->
<!-- 						</a> -->
						<a class="nav-link collapsed" href="/hotels" >
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 호텔등록
						</a>
						<a class="nav-link collapsed" href="/destinations" >
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 목적지등록
						</a>
						<a class="nav-link collapsed" href="/restaurants" >
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 식당등록
						</a>
						<a class="nav-link collapsed" href="/attractions" >
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 명소등록
						</a>
						<a class="nav-link collapsed" href="/packages" >
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 패키지등록
						</a>
						<!-- <div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								
							</nav>
						</div> -->
						<div class="sb-sidenav-menu-heading">Customer Service</div>
						<a class="nav-link" href="/packages/list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 패키지 수정, 삭제
						</a> 
						<a class="nav-link" href="/email">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 이메일 알림
						</a> 
						<a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 고객센터 Q&A
						</a>
						<div class="sb-nav-link-icon">
							<a class="nav-link" href="/">메인으로 돌아가기</a>
						</div>
					</div>
				</div>


				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Administrator
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h2 class="mt-4">한눈에 보기</h2>
					<br>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">대륙별 여행상품</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">동아시아(중국, 일본, 대만)</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">동남아시아(필리핀, 베트남, 태국 등)</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">유럽(영국, 프랑스, 스페인, 터키 등)</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">아메리카(미국, 캐나다, 멕시코)</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<!-- <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div> -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 고객센터 Q&A
						</div>
						<!-- <div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<tr>
										<td>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
										<td>2011/07/25</td>
										<td>$170,750</td>
									</tr>
								</tbody>
							</table>
						</div> -->
						<div class="container">
							<div class="row">
								<div class="col-xs-12">
									<table
										class="table table-bordered table-hover dt-responsive">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>제목</th>
												<th>카테고리</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Argentina</td>
												<td>Spanish (official), English, Italian, German,
													French</td>
												<td>41,803,125</td>
												<td>31.3</td>
												<td>2,780,387</td>
											</tr>
											<tr>
												<td>Australia</td>
												<td>English 79%, native and other languages</td>
												<td>23,630,169</td>
												<td>37.3</td>
												<td>7,739,983</td>
											</tr>
											<tr>
												<td>Greece</td>
												<td>Greek 99% (official), English, French</td>
												<td>11,128,404</td>
												<td>43.2</td>
												<td>131,956</td>
											</tr>
											<tr>
												<td>Luxembourg</td>
												<td>Luxermbourgish (national) French, German (both
													administrative)</td>
												<td>536,761</td>
												<td>39.1</td>
												<td>2,586</td>
											</tr>
											<tr>
												<td>Russia</td>
												<td>Russian, others</td>
												<td>142,467,651</td>
												<td>38.4</td>
												<td>17,076,310</td>
											</tr>
											<tr>
												<td>Sweden</td>
												<td>Swedish, small Sami- and Finnish-speaking
													minorities</td>
												<td>9,631,261</td>
												<td>41.1</td>
												<td>449,954</td>
											</tr>
										</tbody>
										<!-- <tfoot>
											<tr>
												<td colspan="5" class="text-center">Data retrieved from
													<a href="http://www.infoplease.com/ipa/A0855611.html"
													target="_blank">infoplease</a> and <a
													href="http://www.worldometers.info/world-population/population-by-country/"
													target="_blank">worldometers</a>.
												</td>
											</tr>
										</tfoot> -->
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/admin/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="/admin/assets/demo/chart-area-demo.js"></script>
	<script src="/admin/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="/admin/js/datatables-simple-demo.js"></script>

</body>
</html>