<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/full.css">
<link rel="stylesheet" href="../resources/css/mypage.css">
</head>
<body>
	<div class="wrap">
		<div class="img">
			<img src="../resources/images/2-1.jpg" class="main_img">
		</div>
		<div class="text">
			<p>회원정보 수정</p>
		</div>
	</div>
	<hr />
	<span>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>


	<!-- 집 아이콘 -->
	<svg xmlns="http://www.w3.org/2000/svg" width="22" height="19"
		fill="currentColor" class="bi bi-globe2" viewBox="0 0 16 16">
	  <path
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm7.5-6.923c-.67.204-1.335.82-1.887 1.855-.143.268-.276.56-.395.872.705.157 1.472.257 2.282.287V1.077zM4.249 3.539c.142-.384.304-.744.481-1.078a6.7 6.7 0 0 1 .597-.933A7.01 7.01 0 0 0 3.051 3.05c.362.184.763.349 1.198.49zM3.509 7.5c.036-1.07.188-2.087.436-3.008a9.124 9.124 0 0 1-1.565-.667A6.964 6.964 0 0 0 1.018 7.5h2.49zm1.4-2.741a12.344 12.344 0 0 0-.4 2.741H7.5V5.091c-.91-.03-1.783-.145-2.591-.332zM8.5 5.09V7.5h2.99a12.342 12.342 0 0 0-.399-2.741c-.808.187-1.681.301-2.591.332zM4.51 8.5c.035.987.176 1.914.399 2.741A13.612 13.612 0 0 1 7.5 10.91V8.5H4.51zm3.99 0v2.409c.91.03 1.783.145 2.591.332.223-.827.364-1.754.4-2.741H8.5zm-3.282 3.696c.12.312.252.604.395.872.552 1.035 1.218 1.65 1.887 1.855V11.91c-.81.03-1.577.13-2.282.287zm.11 2.276a6.696 6.696 0 0 1-.598-.933 8.853 8.853 0 0 1-.481-1.079 8.38 8.38 0 0 0-1.198.49 7.01 7.01 0 0 0 2.276 1.522zm-1.383-2.964A13.36 13.36 0 0 1 3.508 8.5h-2.49a6.963 6.963 0 0 0 1.362 3.675c.47-.258.995-.482 1.565-.667zm6.728 2.964a7.009 7.009 0 0 0 2.275-1.521 8.376 8.376 0 0 0-1.197-.49 8.853 8.853 0 0 1-.481 1.078 6.688 6.688 0 0 1-.597.933zM8.5 11.909v3.014c.67-.204 1.335-.82 1.887-1.855.143-.268.276-.56.395-.872A12.63 12.63 0 0 0 8.5 11.91zm3.555-.401c.57.185 1.095.409 1.565.667A6.963 6.963 0 0 0 14.982 8.5h-2.49a13.36 13.36 0 0 1-.437 3.008zM14.982 7.5a6.963 6.963 0 0 0-1.362-3.675c-.47.258-.995.482-1.565.667.248.92.4 1.938.437 3.008h2.49zM11.27 2.461c.177.334.339.694.482 1.078a8.368 8.368 0 0 0 1.196-.49 7.01 7.01 0 0 0-2.275-1.52c.218.283.418.597.597.932zm-.488 1.343a7.765 7.765 0 0 0-.395-.872C9.835 1.897 9.17 1.282 8.5 1.077V4.09c.81-.03 1.577-.13 2.282-.287z" />
	</svg>

	<span>&nbsp;&nbsp;&nbsp;</span>

	<!--대분류입니다.--->
	<select class="dropdown" name="mainCategory" id="mainCategory" onchange="">
		<option value="">메뉴 선택</option>
		
	</select>

	<span>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;</span>

	<!--중분류입니다.(회원정보 관리에 해당하는)-->
	<select class="dropdown" name="subCategory" id="subCategory" onchange="location.href=this.value">
		<option value="">메뉴 선택</option>
	</select>

	<hr />

	<h4>필수입력 정보</h4>
	<div class="form_table">
		<form id="modify_form" method="post">
			<input type="hidden" id="phoneNum" name="phoneNum" value="" />
			<input type="hidden" id="email" name="email" value="" />
			<input type="hidden" id="id" name="id" value="${lvo.id}" />
			
			<table class="fit">
				<%-- <caption>필수입력 정보 : 아이디, 이름, 생년월일, 성별, 자택 주소, 휴대 전화번호, 이메일 주소</caption> --%>
				<colgroup>
					<col style="width: 200px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td class="only_text">${lvo.id}</td>
					</tr>

					<tr>
						<th scope="row">이름</th>
						<td class="only_text">${mvo.name}</td>
					</tr>


					<tr>
						<th scope="row"><label for="birthday">생년월일</label></th>
						<td class="only_text">${mvo.birth_date }<input id="birthday"
							name="birthday" class="date" size="20" readonly="true"
							type="hidden" value="" />
						</td>
					</tr>

					<tr>
					<tr>
						<th scope="row">휴대 전화번호</th>
						<td><select id="tel_1" name="tel_1" title="휴대전화번호 앞자리 선택"><option
									value="">국 선택</option>
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option></select> <input id="tel_2" name="tel_2"
							class="number" title="휴대전화번호 중간자리 4자리 입력" type="text" value=""
							size="4" maxlength="4" /> <input id="tel_3" name="tel_3"
							class="number" title="휴대전화번호 마지막자리 4자리 입력" type="text" value=""
							size="4" maxlength="4" />
					
						</td>
					</tr>
					<tr>
						<th scope="row">이메일 주소</th>
						<td><input id="email_1" name="email_1" title="이메일 아이디"
							type="text" value="wns8385" size="20" maxlength="100" />@
							<input
							id="email_2" name="email_2" title="이메일 도메인 작성" type="text"
							value="naver.com" size="20" maxlength="100" /> <select id = "email_3"
							name="email_list" title="이메일 도메인 선택">
								<option value="1">직접입력</option>
								<option value="chol.com">chol.com</option>

								<option value="dreamwiz.com">dreamwiz.com</option>

								<option value="empal.com">empal.com</option>

								<option value="empas.com">empas.com</option>

								<option value="freechal.com">freechal.com</option>

								<option value="gmail.com">gmail.com</option>

								<option value="hanafos.com">hanafos.com</option>

								<option value="hanmail.net">hanmail.net</option>

								<option value="hanmir.com">hanmir.com</option>

								<option value="hitel.net">hitel.net</option>

								<option value="hotmail.com">hotmail.com</option>

								<option value="korea.com">korea.com</option>

								<option value="lycos.co.kr">lycos.co.kr</option>

								<option value="megapass.net">megapass.net</option>

								<option value="nate.com">nate.com</option>

								<option value="naver.com">naver.com</option>

								<option value="paran.com">paran.com</option>

								<option value="sayclub.net">sayclub.net</option>

								<option value="shinbiro.com">shinbiro.com</option>

								<option value="yahoo.co.kr">yahoo.co.kr</option>
						</select></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<br>
	<br>

	<div class="text-center">
		<p>
			<input type="button" onclick="modify_submit()" class="modify_button btn-primary btn-lg" value="정보수정">
			<input type="button" class="cancle_button btn-danger btn-lg" value="취소" onclick="location.href='/main'">
		</p>
	</div>
	<script>
	//이메일 입력방식 선택
	$('#email_3').change(function(){
	   $("#email_3 option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력
				 $("#email_2").val('');                        //값 초기화
				 $("#email_2").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#email_2").val($(this).text());      //선택값 입력
				 $("#email_2").attr("disabled",true); //비활성화
			}
	   });
	});
	</script>
	<script>
		//수정 전 휴대 전화번호
		var Num_phone = '${lvo.phoneNum}';
		var str_num = Num_phone.split('-');
		$("#tel_1").val(str_num[0]);
		$("#tel_2").val(str_num[1]);
		$("#tel_3").val(str_num[2]);

		//수정 전 이메일
		var email = '${mvo.email}'
		var str_mail = email.split('@');
		$('#email_1').val(str_mail[0]);
		$('#email_2').val(str_mail[1]);

		
	function modify_submit() {
		var RegExpTest = /^[0-9]{4}$/; //전화번호 유효성검사
		
		if ($("#tel_1").val() == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		if ($("#tel_2").val() == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		if ($("#tel_3").val() == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		if ($("#email_1").val() == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		if ($("#email_2").val() == "") {
			alert("이메일을 입력하세요.");
			return false;
		}

		//휴대폰 번호 형식 검사
		if (!RegExpTest.test($("#tel_2").val())) {
			alert('휴대전화번호 숫자 4자리를 입력해주세요.');
			return false;
		}
		if (!RegExpTest.test($("#tel_3").val())) {
			alert('휴대전화번호 숫자 4자리를 입력해주세요.');
			return false;
		}
		
		var form = $("#modify_form");
		//수정 후 휴대전화
 		var tel_1 = $("#tel_1").val();
		var tel_2 = $("#tel_2").val();
		var tel_3 = $("#tel_3").val();
		var phoneNum = "";
		//수정 후 이메일
		var email_1 = $("#email_1").val();
		var email_2 = $("#email_2").val();
		var email = "";
		
		phoneNum = tel_1 + "-" + tel_2 + "-" + tel_3;
		$("#phoneNum").val(phoneNum); 
		
		email = email_1 + "@" + email_2;
		$("#email").val(email);

		form.submit();
	}
	</script>
	<script>
	$(document).ready(function () {
		//수정 전 휴대 전화번호
		var Num_phone = '${lvo.phoneNum}';
		console.log(Num_phone);
		var str_num = Num_phone.split('-');
		$("#tel_1").val(str_num[0]);
		$("#tel_2").val(str_num[1]);
		$("#tel_3").val(str_num[2]);

		//수정 전 이메일
		var email = '${mvo.email}'
		var str_mail = email.split('@');
		$('#email_1').val(str_mail[0]);
		$('#email_2').val(str_mail[1]);
    });
	</script>
<script type="text/javascript">
$(document).ready(function() {
      
    //Main 카테고리
    var mainArray = new Array();
    var mainObject = new Object();
      
    mainObject = new Object();
    mainObject.main_category_id = "1";
    mainObject.main_category_name = "회원정보 관리";
    mainArray.push(mainObject);
      
    mainObject = new Object();
    mainObject.main_category_id = "2";
    mainObject.main_category_name = "동호회 관리";
    mainArray.push(mainObject);
      
    //Sub 카테고리 셋팅
    var subArray = new Array();
    var subObject = new Object();
      
    //1에 해당하는 sub category 리스트
    subObject = new Object();
    subObject.main_category_id = "1";
    subObject.sub_category_id = "/info"
    subObject.sub_category_name = "회원정보 수정"
    subArray.push(subObject);
      
    subObject = new Object();
    subObject.main_category_id = "1";
    subObject.sub_category_id = "/password"
    subObject.sub_category_name = "비밀번호 관리"
    subArray.push(subObject);
      
    subObject = new Object();
    subObject.main_category_id = "1";
    subObject.sub_category_id = "/withDrawal"
    subObject.sub_category_name = "회원 탈퇴"
    subArray.push(subObject);
      
    //2에 해당하는 sub category 리스트
    subObject = new Object();
    subObject.main_category_id = "2";
    subObject.sub_category_id = "/activeList"
    subObject.sub_category_name = "활동 중 동호회"
    subArray.push(subObject);
    
    subObject = new Object();
    subObject.main_category_id = "2";
    subObject.sub_category_id = "/applyList"
    subObject.sub_category_name = "신규동호회 신청현황"
    subArray.push(subObject);
      
    //메인 카테고리 셋팅
    var mainCategorySelectBox = $("select[name='mainCategory']");
      
    for(var i=0;i<mainArray.length;i++){
        mainCategorySelectBox.append("<option value='"+mainArray[i].main_category_id+"'>"+mainArray[i].main_category_name+"</option>");
    }
      
    //main카테고리 선택 후 sub생성
    $(document).on("change","select[name='mainCategory']",function(){
        //두번째 셀렉트 박스 삭제
        var subCategorySelectBox = $("select[name='subCategory']");
        subCategorySelectBox.children().remove(); //기존 리스트 삭제
          
        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣어
        $("option:selected", this).each(function(){
            var selectValue = $(this).val(); //main category 에서 선택한 값
            subCategorySelectBox.append("<option value=''>전체</option>");
            for(var i=0;i<subArray.length;i++){
                if(selectValue == subArray[i].main_category_id){
                    subCategorySelectBox.append("<option value='"+subArray[i].sub_category_id+"'>"+subArray[i].sub_category_name+"</option>");
                }
            }
        });
          
    });
});
</script>
<script>
var result_email = '${result_email}';
var result_phoneNum = '${result_phoneNum}';
console.log(result_email);
console.log(result_phoneNum);

if(result_email == 1){
	alert("정보가 정상적으로 수정되었습니다.");
}

</script>
	<%@include file="../include/footer.jsp"%>