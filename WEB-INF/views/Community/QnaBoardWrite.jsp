 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/Qna.css">
   <link rel="stylesheet" href="../resources/css/full.css">
  <div class = "container" style="margin-top: 100px;">
       <img src="../resources/images/hyerim.jpg" width="100%" height="400px">
	<div class="container">
		<div class="row">
		<form id="form" name="form" action="/qnaboard/registerProc" method="post">
			<input type="hidden" name="id" value="${lvo.id}"/>
			<table class="table table-striped" style="text-align:center; border :1px solid #dddddd" > <%-- 홀,짝 행 구분 --%>
				<tbody>
					<td class="table_free_cus">
						<select id="cate_num" name="cate_num">
							<option>--카테고리 선택--</option> 
							<c:forEach items="${cateList}" var="category">
								<option value="${category.cate_num}"<c:if test="${category.cate_num == board.cate_num}">selected="selected"</c:if>>${category.cate_kind}</option>
							</c:forEach>
						</select>
					</td>
					<tr>
						<td><input type="text" style="text-align:center;" class="form-control" placeholder="제목을 입력해주세요!" name="title" maxlength="50"></td>
					</tr>
					<tr>
						<td>
							<textarea type="text" style="text-align:center;" class="form-control" placeholder="내용을 입력해 주세요!" name="content" maxlength="4000" style="height:350px;"></textarea>
    					</td>
    				</tr>
    				<tr>	
		    			<div class="form-check form-check-inline mt-3" style='float:right';">
    						<input class="form-check-input" type="checkbox" name="secret_type" id="secret_type" value="1">
    						<label class="form-check-label" >비밀글 설정</label>
		    			</div>
					</tr>
				</tbody>
			</table>
			<div style="text-align:center;">
				<button type="submit" class="btn btn-default" id="register_btn">작성 완료</button>
				<button type="reset" class="btn btn-default" id="reset_btn" onclick="location.href='/qnaboard/qnalist'">작성 취소</button>
  			</div>	
		</form>
		</div>
	</div>		
	</div>
	
<script type="text/javascript">

$("#register_btn").click(function(){
	if(confirm('저장하시겠습니까?')){
		document.form.submit();
	}
});

$("#reset_btn").click(function(){
	if(confirm('작성을 취소 하시겠습니까?')){
		document.form.reset();
	}
});

</script>	
	
<%@include file="../include/footer.jsp"%>
