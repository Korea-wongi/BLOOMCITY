<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 메일</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="/admin/css/styles.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
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
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<div class="sb-sidenav-menu-heading">Membership</div>
							<a class="nav-link" href="/admin/membership">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> 회원관리
							</a>
							<div class="sb-sidenav-menu-heading">Travel Package</div>
							<a class="nav-link collapsed"
								href="<%=contextPath %>/admin/reservation">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 예약관리 <!-- <div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div> -->
							</a>
							<!-- <div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div> -->
							<a class="nav-link collapsed"
								href="<%=contextPath %>/admin/travelpackage">
								<div class="sb-nav-link-icon">
									<i class="fas fa-book-open"></i>
								</div> 여행상품 관리 <!-- <div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div> -->
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
							<a class="nav-link" href="/email">
								<div class="sb-nav-link-icon">
									<i class="fas fa-chart-area"></i>
								</div> 이메일 알림
							</a> <a class="nav-link" href="tables.html">
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
						<h1 class="mt-4">관리자 메일 보내기</h1>
						<!-- <ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol> -->
						<div class="card mb-4">
							<div class="card-body">예약관리 예약관리 예약관리 예약관리 예약관리 예약관리 예약관리
								예약관리 예약관리 &nbsp; &nbsp; &nbsp; &nbsp;</div>
						</div>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 관리자 메일 보내기
							</div>
							<div class="card-body">
								<form action="/email/sendEmail" accept-charset="utf-8"
									name="emailForm" method="post">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">받는
											사람</label> <input type="email" class="form-control"
											id="emailRecipient" name="emailRecipient" value="${param.emailAddress}"
											placeholder="name@example.com">
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput2" class="form-label">제목</label> <input type="text" class="form-control"
											id="emailSubject" name="emailSubject"
											placeholder="제목" >
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">내용</label>
										<textarea class="form-control" id="emailContent"
											name="emailContent" rows="10" placeholder="내용을 입력하세요."></textarea>
									</div>
									<div>
										<input type="submit" value="보내기"/>
										<input type="reset" value="다시 쓰기"/>
										<div class="email-msg">${successMessage }
										${errorMessage } </div>
										
									</div>
								</form>
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
			src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
			crossorigin="anonymous"></script>
		<script src="/admin/js/datatables-simple-demo.js"></script>
</body>
</html>
