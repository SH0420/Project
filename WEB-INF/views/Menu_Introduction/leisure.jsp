
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/fonts/icomoon/style.css">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="../resources/css/bootstrap.min.css"> -->
<!-- Style -->
<!-- <link rel="stylesheet" href="../resources/css/style.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../resources/css/Categroy.css">
<link rel="stylesheet" href="../resources/css/full.css">
<link rel="stylesheet" href="../resources/css/common.css">
<div class="video-box">
	<video class="video-container" autoplay muted loop>
		<source src="../resources/images/레저.mp4" type="video/mp4">
	</video>
</div>
<div class="left-side-bar">
	<!--  <div class="status-ico">
        <span>▶</span>
        <span>▼</span>
    </div> -->
	<ul>
		<li>
		<li><a href="/club/leisure">레져</a></li>
		<li><a href="/club/exercise">운동</a></li>
		<li><a href="/club/travel">맛집</a></li>
		<li><a href="/club/study">스터디</a></li>
		</li>
	</ul>
</div>
<div>

	<div class="container">
		<h2 class="text-primary">LeisureSports</h2>

		<div class="table-responsive board_list">
			<table class="table table-striped custom-table list_tbl">
				<thead>
					<tr>
						<th class="text-black" scope="col">번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">이름</th>
						<th scope="col">게시일</th>
						<th scope="col">모임주기</th>
						<th scope="col"></th>
					</tr>
				</thead>

				<c:forEach items="${list}" var="list">
					<tr>
						<td class="align-middle align-middle "><c:out
								value="${list.rnum}" /></td>
						<td class="align-middle align-middle "><c:if
								test="${list.cate_num eq '00'}">
								<c:out value="공지사항" />
							</c:if> <c:if test="${list.cate_num eq '01'}">
								<c:out value="레저" />
							</c:if> <c:if test="${list.cate_num eq '02'}">
								<c:out value="운동" />
							</c:if> <c:if test="${list.cate_num eq '03'}">
								<c:out value="맛집" />
							</c:if> <c:if test="${list.cate_num eq '04'}">
								<c:out value="스터디" />
							</c:if></td>
						<td class="align-middle align-middle "><c:out
								value="${list.club_name}" /></td>
						<td class="align-middle align-middle "><fmt:formatDate
								value="${list.apply_date}" pattern="yyyy-MM-dd" /></td>
						<td class="align-middle align-middle ">
						
							매주 토요일 07시
						<%-- 	<c:choose>
								<c:when test="${list.meeting_day eq '0'}">매주 월요일</c:when>
								<c:when test="${list.meeting_day eq '1'}">매주 화요일</c:when>
								<c:when test="${list.meeting_day eq '2'}">매주 수요일</c:when>
								<c:when test="${list.meeting_day eq '3'}">매주 목요일</c:when>
								<c:when test="${list.meeting_day eq '4'}">매주 금요일</c:when>
								<c:when test="${list.meeting_day eq '5'}">매주 토요일</c:when>
								<c:when test="${list.meeting_day eq '6'}">매주 일요일</c:when>
							</c:choose>  --%>
							<c:out value=" ${list.meeting_time}시" />
						</td>
						<td class="text-center"><a
							href="/club/detail?cno=${list.cno}"><button
									onclick="javascript:btn()" type="button"
									class="btn btn-sm btn-outline-secondary ani-button">상세정보</button></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<div id="wrapper">
	<div class="topbar" style="position: absolute; top: 0;">
		<!-- 왼쪽 메뉴 -->
		<div class="left side-menu">
			<div class="sidebar-inner">
				<div id="sidebar-menu">
					<ul>
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"> <i class="fas fa-bars"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 왼쪽 서브 메뉴 -->
		<div class="left_sub_menu">
			<div class="sub_menu">
				<input type="search" name="SEARCH" placeholder="SEARCH">
				<h2>TITLE</h2>
				<ul class="big_menu">
					<li>MENU 1 <i class="arrow fas fa-angle-right"></i></li>
					<ul class="small_menu">
						<li><a href="#">소메뉴1-1</a></li>
						<li><a href="#">소메뉴1-2</a></li>
						<li><a href="">소메뉴1-3</a></li>
						<li><a href="#">소메뉴1-4</a></li>
					</ul>
				</ul>
				<ul class="big_menu">
					<li>MENU 2 <i class="arrow fas fa-angle-right"></i></li>
					<ul class="small_menu">
						<li><a href="#">소메뉴2-1</a></li>
						<li><a href="#"></a>소메뉴2-2</a></li>
					</ul>
				</ul>
				<ul class="big_menu">
					<li>MYPAGE</li>
				</ul>
			</div>
		</div>
		<div class="overlay"></div>
	</div>

</div>
<!-- 왼쪽 사이드 메뉴 스크립트 -->
<script>
    $(function () {
        $(".left_sub_menu").hide();
        $(".has_sub").click(function () {
            $(".left_sub_menu").fadeToggle(300);
        });
        // 왼쪽메뉴 드롭다운
        $(".sub_menu ul.small_menu").hide();
        $(".sub_menu ul.big_menu").click(function () {
            $("ul", this).slideToggle(300);
        });
        // 외부 클릭 시 좌측 사이드 메뉴 숨기기
        $('.overlay').on('click', function () {
            $('.left_sub_menu').fadeOut();
            $('.hide_sidemenu').fadeIn();
        });
    });
</script>
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/popper.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/main.js"></script>


<%@include file="../include/footer.jsp"%>