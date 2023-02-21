
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">
<div id="container" class="sub" data-menu-name="회원가입">
	<div class="container_align">
		<div id="SUB-GNB">
			<div id="submenu">
				<ul id="menu_submenu" class="menu_submenu ld1">
				</ul>
			</div>
		</div>
		<!-- <hr class="linebreak">  -->

		<div id="section">
			<section>
				<header>
					<div class="menu_path_box">
						<nav class="menu_path menu_depth_2">
							<a class="home" href="main">HOME</a>
							<div class="ld1">
								<ul class="menu_topmenu ld1">
									<li class="cd1 cd1c8 open hasChild childCount4 fix_menu"><a
										href="#"
										class="l1 menusrl_2 menutype_move_child open active hasChild childCount4"
										data-depth="1"><span>회원가입</span></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</header>

				<div class="modules_fmcs_member modules_member">
					<div class="member_status">
 						<h3>
							<span>회원가입 진행 순서</span>
						</h3> 
						<ol class="status_count_4">
							<li><span>사번인증</span></li>
							<li><span>이용약관동의</span></li>
							<li><span>회원정보입력</span></li>
							<li class="active"><strong>회원가입완료</strong></li>
							
						</ol>
					</div>

				</div>
				
				<fieldset>
						<div class="result_table" style="margin-bottom: 195px;">
							<table class="fit no_thead">
								<span><strong>${id }</strong>님의 회원가입이 완료되었습니다.<br>다양한 정보와 서비스를 제공해 드릴 수 있도록 노력하겠습니다.<br>감사합니다.
								</span>
								<hr />
								<a href="/login" class="check_button">로그인하기</a>
							</table>
						</div>
				</fieldset>
				
			</section>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
