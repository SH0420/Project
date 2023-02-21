
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">
<div id="container" class="sub" data-menu-name="회원가입">
	<div class="container_align"style="margin-bottom: 195px;">
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
							<li class="active"><strong>사번인증</strong></li>
							<li><span>이용약관동의</span></li>
							<li><span>회원정보입력</span></li>
							<li><span>회원가입완료</span></li>
						</ol>
					</div>
				</div>


				<div class="checknumber">
					<ul>
						<li>회원가입을 하시려면 반드시 "사번인증"을 하셔야 합니다.</li>
						<li>조회를 위해 입력되는 정보는 본인확인 과정이며 별도로 저장되지 않습니다.</li>
					</ul>

				</div>

				<form id="join_check" method="post">
					<div class="form_table">
						<table class="fit no_thead">
							<colgroup>
								<col style="width: 10em">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="name">사번</label></th>
									<td><input id="empno" name="empno"
										placeholder="사번을 입력하세요." type="text" size="20" maxlength="20"
										class="input_text join_form_text"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="order_box">
						<button type="submit" class="check_button"
							onclick="submit_check();">인증하기</button>
					</p>
				</form>
		</div>
		</section>
	</div>
</div>
</div>
<script>
	var result = ${result};
	if(!result){
		alert("유효하지 않은 사번입니다.");
	};
	
	function submit_check() {
		var empno = document.getElementById("empno");
		var form = document.getElementById('join_check');

		if (empno.value == "") {
			alert("사번을 입력하세요.");
			empno.focus();
			return false;
		}
	}
		
</script>
<%@include file="../include/footer.jsp"%>
