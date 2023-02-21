<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../resources/css/userAuthcss.css" rel="stylesheet" />
<link href="../resources/css/mypage.css" rel="stylesheet" />
<link href="../resources/css/full.css" rel="stylesheet" />

<%@include file="../include/header.jsp"%>
</head>
<body>
	<div class="wrap">
		<div class="img">
			<img src="../resources/images/2-1.jpg" class="main_img">
		</div>
		<div class="text">
			<p>My Page</p>
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
	<select class="dropdown" name="mainCategory" id="mainCategory" onchange="" disabled>
		<option value="">메뉴 선택</option>
		
	</select>

	<span>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;</span>

	<!--중분류입니다.(회원정보 관리에 해당하는)-->
	<select class="dropdown" name="subCategory" id="subCategory" onchange="location.href=this.value" disabled>
		<option value="">메뉴 선택</option>
	</select>

	<hr />
	<form id="mypage_pw" method="post">
	<fieldset>
		<div class="messagebox">
			<div>
				<ul>
					<li>개인정보 보호를 위하여 비밀번호 확인 후 회원정보의 관리/변경이 가능합니다.</li>
					<li>아래 비밀번호 입력란에 비밀번호 입력 후 &quot;비밀번호 확인&quot;을 클릭하세요.</li>
				</ul>
			</div>
		</div>
		<br>
		<h4>비밀번호 입력</h4>
		<table class="fit">
			<colgroup>
				<col style="width: 25%" />
				<col style="width: auto" />
			</colgroup>

			<div class="container2">
				<div class="row">
				   <div class="col-sm-3"><label for="user_password" class="mypage_cus">비밀번호</label></div>
				   <div class="col-sm-9"><input id="user_password" name="user_password" placeholder="비밀번호를 입력해 주세요." autofocus="autofocus" type="password" value="" size="50" style="color:gray; height: 50px;"/></div>
				</div>
			</div>
		</table>
		<div class="text-center">
			<p class="order_box">
				<button type="button" class="mypage_pw btn-primary btn-lg" onclick="check_pw()">확인</button>
				<button type="button" class="findpw_button btn-danger btn-lg" onclick="">취소</button>
			</p>
		</div>
	</fieldset>
</form>

<script>

check_pw = function(){
	var form = $("#mypage_pw");
	var user_password = document.getElementById("user_password").value;
	console.log(user_password);
	
		//공백확인
		if (user_password == "" ) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		form.submit();
	}
</script>
<script>
	//비밀번호 확인
 	var result = ${result};
	if(result == 1 ){
		alert("확인되었습니다.");
		location.href="/info";
	}else if(result == 0){
		alert("비밀번호를 확인해주세요.");
	}
</script>
<script>	
	var msg = ${msg};
	console.log(msg);
	if(!msg){
		alert("로그인이 필요한 페이지입니다.");

		location.href="/login";
	}else{
		alert("확인");
	}
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

<%@include file="../include/footer.jsp"%>
