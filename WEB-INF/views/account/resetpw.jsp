
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<div id="container" class="sub" data-menu-name="비밀번호 찾기">
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
										data-depth="1"><span>비밀번호 찾기</span></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</header>

				<form id="reset_pw" method="post">
				<fieldset>
					<div class="table_css">
						<div class="form_table">
							<table class="fit no_thead">
								<colgroup>
									<col width="200">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="name">새로운 비밀번호<em>*</em></label></th>
										<td><input id="pw" name="pw"
											placeholder="새로운 비밀번호를 입력하세요." type="password" value=""
											class="input_text"></td>
									</tr>
									<tr>
										<th scope="row"><label for="name">비밀번호 확인<em>*</em></label></th>
										<td><input id="pw_ck" name="pw_ck"
											placeholder="비밀번호를 입력하세요." type="password" value=""
											class="input_text"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="order_box">
							<button type="button" class="resetPw_button btn btn-primary" onclick="resetPw()">변경하기</button>
						</div>

					</div>
				</fieldset>
				</form>
			</section>
		</div>
	</div>
</div>
<script>

resetPw = function(){
	var form = $("#reset_pw");
	var pw = $("#pw").val();
	var pw_ck = $("#pw_ck").val();
	var RegExp = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;//password 유효성 검사 정규식

		if (pw == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (pw_ck == "") {
			alert("비밀번호를 확인을 입력하세요.");
			return false;
		}
		
		if(pw != pw_ck){
			alert('비밀번호가 일치하지 않습니다.');	
			return false;
		}

		//패스워드 형식검사
		if(!RegExp.test(pw_ck)){ 
	    alert("비밀번호는 문자, 숫자, 특수문자가 각각 최소 1개 이상 포함, 최소 8자리로 입력하여 주세요.");
	    return false;
	}
		
		form.submit();
	}
	
</script>

<script>

var pw_result= ${result };
console.log(pw_result);

if(pw_result == 1){
	alert("정상적으로 변경되었습니다.");
	location.href="/login";
}else{
	alert("비밀번호 변경을 실패했습니다.")
}
</script>
<%@include file="../include/footer.jsp"%>
