
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">
<div id="container" class="sub" data-menu-name="비밀번호 찾기">
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
										data-depth="1"><span>비밀번호 찾기</span></a></li>
								</ul>
							</div>
						</nav>
					</div>
				</header>
				<!-- form  -->
				<form id="find_pw" method="post">
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
										<th scope="row"><label for="empno">사번<em>*</em></label></th>
										<td><input id="empno" name="empno" placeholder="사번을 입력하세요."
											type="text" value="" class="input_text join_form_text"></td>
									</tr>
									<tr>
										<th scope="row"><label for="id">아이디<em>*</em></label></th>
										<td><input id="id" name="id"
											placeholder="아이디를 입력하세요." type="text" value=""
											class="input_text join_form_text">
											<button type="submit" class="mail_check_button" onclick="">인증번호 발송</button>
											<input type="hidden" name="checked_pw" value=""></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="mail_check_num">인증번호<em>*</em></label></th>
										<td><input id="mail_check_num" name="mail_check_num"
											placeholder="인증번호를 입력하세요." type="text" value=""
											class="input_text join_form_text"></td>
									</tr>

								</tbody>
							</table>

						</div>
						<p class="order_box">
							<button type="button" class="findpw_button check_button" onclick="findpw()">확인</button><a href="/findpw"
								class="true">취소</a>
						</p>
					</div>
				</fieldset>
				</form>
			</section>
		</div>
	</div>
</div>

<script>
var result;

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
 	
	var empno = $("#empno").val();
	var id = $("#id").val();
	var data = {id : id, empno : empno}
	console.log(empno);

 	if (empno == "") {
		alert("사번을 입력하세요.");
		return false;
	}
	if (id == "") {
		alert("아이디를 입력하세요.");
		return false;
	} 

     $.ajax({
        type:"POST",
        url:"mailCheck",
        data: data,
        async: false, //비동기 방식이 기본이기 때문에 undefined가 리턴
        success:function(data){
        	if(data == 1){
        		 alert("해당 정보가 없습니다. ");
        	}else{
        		//받은 인증번호와 입력받은 값 비교 
        		alert("회사계정 이메일로 인증번호가 발송되었습니다.")
        		result = data;
        	} 
        	$("input[name=checked_pw]").val('y');
        }
    });  
	return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막음
});

findpw = function(){
	var form = $("#find_pw");
	var mail_check_num = document.getElementById("mail_check_num").value;

		//인증번호 발송 여부
	   	if($("input[name='checked_pw']").val()==''){
	        alert('인증번호 발송을 클릭해주세요.');
	        $("input[name='checked_pw']").eq(0).focus();
	        return false;
	  	}
	
		//공백확인
		if (mail_check_num == "" ) {
			alert("인증번호를 입력하세요.");
			return false;
		}
		
		//인증번호 동일 여부 확인
		if(result == mail_check_num){
			alert("정상적으로 인증되었습니다.")
		}else{
			alert("일치하지 않는 인증번호입니다.");
			return false;
		}
		
		form.submit();
	}
</script>


<%@include file="../include/footer.jsp"%>
