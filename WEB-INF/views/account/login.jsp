<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet"/>
<link rel="stylesheet" href="../resources/css/full.css">
<div id="container" class="sub" data-menu-name="로그인">
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
							<a class="home" href="#">HOME</a>
							<div class="ld1">
								<ul class="menu_topmenu ld1">
									<li class="cd1 cd1c8 open hasChild childCount4 fix_menu"><a
										href="#"
										class="l1 menusrl_2 menutype_move_child open active hasChild childCount4"
										data-depth="1"><span>로그인</span></a></li>
								</ul>
							</div>
							<div class="ld2">
								<ul class="ld2 open">
									<li class="cd2 cd2c1 open nowmenu fix_menu"><a href="#"
										class="l2 menusrl_3 menutype_modules_fmcs_member open nowmenu active"
										data-depth="2"><span>회원로그인 <input type="checkbox"
												name="userlogin" onclick="movepage('/login')" checked></span></a></li>
								</ul>
							</div>
							<div class="ld3">
								<ul class="ld3 open">
									<li class="cd2 cd2c1 open nowmenu fix_menu"><a href="#"
										class="l2 menusrl_3 menutype_modules_fmcs_member open nowmenu active"
										data-depth="2"><span>관리자로그인 <input type="checkbox"
												name="adminlogin" onclick="movepage('/admin')"></span></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</header>

				<div id="contents" class="contents" style="margin-bottom: 195px;">
					<article class="contents_article">
						<div class="modules_fmcs_member">
							<div class="proc_login proc_login_single">
								<div class="section_box">
									<div class="section1">
										<h2>회원 로그인</h2>
										<form id="Login_Form" method="post">
									<fieldset>
												<div class="inbox">
													<p class="input_id">
														<label for="user_id"></label><input id="id"
															name="id" placeholder="아이디" autofocus="autofocus"
															type="text" value="" maxlength="30" class="input_text">
													</p>
													<p class="input_pw">
														<label for="user_password"></label><input
															id="pw" name="pw"
															placeholder="비밀번호" type="password" value=""
															maxlength="30" class="input_password">
													</p>
													<p class="submit">
														<input type="button" onclick="login_click()" class = "login_button btn-primary" value="로그인" />
													</p>
												</div>
											</fieldset>
										</form>

										<p class="link_box">
											<a href="/join_check">회원가입</a> <a href="/findid">아이디찾기</a> <a href="findpw">비밀번호찾기</a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</article>
				</div>
			</section>
		</div>
	</div>
</div>


<script>
//엔터처리
$('#id, #pw').on('keypress', function(e){
	  if(e.keyCode == '13'){
		$('.login_button').click();
	  }
	  });

//로그인 버튼 클릭 메서드
  login_click = function(){
	var form = $("#Login_Form");
	var id = $("#id").val();
	var pw = $("#pw").val();

	if (id == "") {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (pw == "") {
		alert("패스워드를 입력하세요.");
		return false;
	}
	form.submit();
}
</script>


<script>

//로그인 실패 메서드
var admin_type = ${admin_type};
console.log(admin_type);

if(admin_type == 1){
	alert("관리자 로그인 페이지로 이동합니다.");
	location.href="/admin";
}else{
	alert("로그인정보가 없습니다.");
}; 

</script>
<script>
//체크박스 클릭시 페이지 이동
function movepage(page){
window.document.location.href=page;
return;
}

</script>
<%@include file="../include/footer.jsp"%>
