
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">
<div id="container" class="sub" data-menu-name="아이디 찾기">
	<div class="container_align">
		<div id="SUB-GNB">
			<div id="submenu">
				<ul id="menu_submenu" class="menu_submenu ld1">
				</ul>
			</div>
		</div>

		<div id="section">
			<section>
				<header>
					<div class="menu_path_box">
						<nav class="menu_path menu_depth_2">
							<a class="home" href="#">HOME</a>
							<div class="ld1">
								<ul class="menu_topmenu ld1">
									<li class="cd1 cd1c8 open hasChild childCount4 fix_menu"><a
										href="#"
										class="l1 menusrl_2 menutype_move_child open active hasChild childCount4"
										data-depth="1"><span>아이디 찾기</span></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</header>
				<!-- form  -->
				<fieldset>

						<div class="result_table">
							<table class="fit no_thead">
								<span>회원님의 아이디는 <strong>${id }</strong> 입니다.</span>
								<hr />
								<a href="/login" class="check_button">로그인하기</a>
								<a href="/findpw" class="check_button">비밀번호 찾기</a>
							</table>
						</div>
				</fieldset>

			</section>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
