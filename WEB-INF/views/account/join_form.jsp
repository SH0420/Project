
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.zerock.domain.MemberVO"%>
<%=session.getAttribute("member")%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberVO vo = (MemberVO) session.getAttribute("member");
	String empno = vo.getEmpno();
	String name = vo.getName();
%>

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
							<li class="active"><strong>회원정보입력</strong></li>
							<li><span>회원가입완료</span></li>
						</ol>
					</div>
				</div>

				<!-- form  -->

				<form id="join_form" method="post">
					<input type="hidden" id="phoneNum" name="phoneNum" value="" />
					<div class="form_table">
						<table class="fit no_thead">
							<colgroup>
								<col width="200">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="name">사번<em>*</em></label></th>
									<td><input id="empno" name="empno" placeholder=<%=empno%>
										type="text" value=<%=empno%> class="input_text join_form_text" readonly></td>
								</tr>
								<tr>
									<th scope="row"><label for="name">이름<em>*</em></label></th>
									<td><input id="name" nam e="name" placeholder=<%=name%>
										type="text" value=<%=name%> class="input_text" readonly></td>
								</tr>

								<tr>
									<th scope="row"><label for="id">아이디<em>*</em></label></th>
									<td><input id="id" name="id" placeholder="아이디를 입력하세요."
										type="text" class="id join_form_text">
										<button type="button" class="id_double_button">중복확인</button> <input
										type="hidden" name="checked_id" value=""></td>

								</tr>

								<!-- limi -->

								<tr>
									<th scope="row"><label for="pw">비밀번호<em>*</em></label></th>
									<td><input id="pw" name="pw" placeholder="비밀번호를 입력하세요."
										type="password" value="" class="pw join_form_text"></td>
								</tr>
								<tr>
									<th scope="row"><label for="passwordck">비밀번호 확인<em>*</em></label></th>
									<td><input id="pwck_input" name="pwck_input"
										placeholder="비밀번호를 입력하세요." type="password" value=""
										class="pwck_input join_form_text"> <span class="pwck_input_re_1"
										style="display: none;">비밀번호가 일치합니다.</span> <span
										class="pwck_input_re_2" style="display: none;">비밀번호가
											일치하지 않습니다.</span></td>
								</tr>
								<tr>
									<th scope="row">휴대전화번호<em>*</em></th>
									<td><select id="tel_1" name="tel_1" title="휴대전화번호 앞자리 선택">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select> <input id="tel_2" maxlength="4" name="tel_2"
										class="number input_text" title="휴대전화번호 중간자리 3~4자리 입력"
										type="text" value="" size="4" maxlength="4"> <input
										id="tel_3" name="tel_3" maxlength="4"
										class="number input_text" title="휴대전화번호 마지막자리 4자리 입력"
										type="text" value="" size="4" maxlength="4"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="order_box">
						<button type="button" class="join_button" onclick="join_check()">가입하기</button>
					</p>
		</div>
		</form>
		</section>
	</div>
</div>
</div>
<script>
	//공백검사
	function join_check() {
		var empno = document.getElementById("empno").value;
		//console.log("empno : " + empno);
		var form = document.getElementById("join_form");
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var pwck = document.getElementById("pwck_input");
		var RegExp = /^[a-zA-Z0-9]{4,12}$/; //id와 유효성 검사 정규식
		var RegExpPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;//password 유효성 검사 정규식
		var RegExpTest = /^[0-9]{4}$/; //전화번호 유효성검사
		var tel_1 = $("#tel_1").val();
		var tel_2 = $("#tel_2").val();
		var tel_3 = $("#tel_3").val();
		var phoneNum = "";
		phoneNum = tel_1 + "-" + tel_2 + "-" + tel_3;
		//console.log("phonenum : " + phoneNum);
		$("#phoneNum").val(phoneNum);
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (pw.value == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
		if (pwck_input.value == "") {
			alert("패스워드 확인을 입력하세요.");
			return false;
		}
		if (!tel_1) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		if (!tel_2) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		if (!tel_3) {
			alert("올바른 휴대전화를 입력하세요.");
			return false;
		}
		//아이디 중복체크 여부
		if ($("input[name='checked_id']").val() == '') {
			alert('아이디 중복체크를 해주세요.');
			$("input[name='checked_id']").eq(0).focus();
			return false;
		}
		//비밀번호 확인 일치 여부
		if (pw.value != pwck.value) {
			alert('올바른 비밀번호를 입력해주세요.');
			return false;
		}
		//패스워드 형식검사
		if (!RegExpPw.test(pwck.value)) {
			alert("비밀번호는 문자, 숫자, 특수문자가 각각 최소 1개 이상 포함, 최소 8자리로 입력하여 주세요.");
			return false;
		}
		//휴대폰 번호 검사
		if (!RegExpTest.test(tel_2)) {
			alert('숫자 4자리를 입력해주세요.');
			return false;
		}
		if (!RegExpTest.test(tel_3)) {
			alert('숫자 4자리를 입력해주세요.');
			return false;
		}
		form.submit();
	}
	//아이디 중복체크
	$('.id_double_button').click(function() {
		var memberId = $('.id').val();
		var data = {
			memberId : memberId
		}
		var RegExp = /^[a-zA-Z0-9]{4,12}$/; //id
		
		//아이디 형식검사
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			return false;
		} else if (!RegExp.test(memberId)) {
			alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
			return false;
		} else if (memberId.match(RegExp)) {
			
			$.ajax({
				type : "post",
				url : "/memberIdChk",
				data : data,
				success : function(result) {
					if (result == "fail") {
						alert("사용 불가한 아이디입니다.");
						$('.id').val("");
					} else {
						//체크 여부 확인
						$("input[name=checked_id]").val('y');
						alert("사용 가능한 아이디 입니다.");
					}
				}
			});
		}
	});
	//비밀번호 확인
	$('.pwck_input').on("propertychange change keyup paste input", function() {
		var pw = $('.pw').val();
		var pwck = $('.pwck_input').val();
		if (pw == pwck) {
			$('.pwck_input_re_1').css('display', 'block');
			$('.pwck_input_re_2').css('display', 'none');
		} else {
			$('.pwck_input_re_1').css('display', 'none');
			$('.pwck_input_re_2').css('display', 'block');
		}
	});
</script>
<%@include file="../include/footer.jsp"%>
