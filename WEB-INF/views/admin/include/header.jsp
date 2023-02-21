<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
boolean idSession = (session.getAttribute("id") != null);
if (idSession) {
  //세션의 값을 가져오기
  	System.out.println("id : " + session.getAttribute("id") );
	System.out.println("lvo : " + session.getAttribute("lvo") );
	System.out.println("세션 유효 : " + request.isRequestedSessionIdValid());
}
%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>S.F</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/full.css" rel="stylesheet" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/scripts.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/6e77d299cc.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- Navigation-->
	<div>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top"
			id="mainNav">
			<div class="container px-4 px-lg-5" style="margin-top: 10px;">
				<a class="navbar-brand" href="/main"><i
					class="fa-solid fa-otter" style="font-size: 60px; color: darkblue;"><span
						style="font-size: 20px;">OORT CLOUD</span> </i></a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">

					<i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a class="nav-link "
							id="navbarDropdown" href="/club/leisure" role="button">동호회소개</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">동호회신청</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/club/list"> 동호회 신청</a></li>
								<c:if test="${!empty lvo.id}">
									<li><a class="dropdown-item" href="/club/newclubapply">
											신규동호회 등록</a></li>
								</c:if>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/board/list">자유게시판</a></li>
								<li><a class="dropdown-item" href="/qnaboard/qnalist">Q&A</a></li>
							</ul></li>

						<c:choose>
							<c:when test="${lvo.admin_type eq 1 }">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자
										메뉴</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/admin_board/freelist">게시판
												관리</a></li>
										<li><a class="dropdown-item" href="/admin_board/qnalist">Q&A관리</a></li>
										<li><a class="dropdown-item"
											href="/admin_member/management">회원 관리</a></li>
										<li><a class="dropdown-item" href="/admin_club/applist">동호회
												등록</a></li>
										<li><a class="dropdown-item"
											href="/admin_club/management">동호회 관리</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<c:if test="${!empty lvo.id}">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
										role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="/mypage">회원 정보 관리</a></li>
											<li><a class="dropdown-item" href="/mypage">동호회 신청
													현황</a></li>
										</ul></li>
								</c:if>
							</c:otherwise>
						</c:choose>

						<div id="login"
							style="position: absolute; top: 0px; right: 150px;">
							<% if (idSession) { %>
							<ul
								style="list-style: none; display: flex; text-decoration: none; color: black;">
								<a href="/main" style="color: black;"><li>홈</li></a>
								<li>|</li>
								<a href="/logout" style="color: black;"><li>로그아웃</li></a>
							</ul>
							<%} else{ %>
							<ul
								style="list-style: none; display: flex; text-decoration: none; color: black;">
								<a href="/main" style="color: black;"><li>홈</li></a>
								<li>|</li>
								<a href="/login" style="color: black;"><li>로그인</li></a>
								<li>|</li>
								<a href="/join_check" style="color: black;"><li>회원가입</li></a>
							</ul>
							<%}; %>
						</div>
					</ul>
				</div>
			</div>
		</nav>

	</div>