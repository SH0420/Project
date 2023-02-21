 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/boardcss.css">
<link rel="stylesheet" href="../resources/css/Free1.css">
   <link rel="stylesheet" href="../resources/css/full.css">
   
   
  <div class = "container" style="margin-top: 100px;">
       <img src="../resources/images/hyerim.jpg" width="100%" height="400px">
	<div class="container">
		<div class="row">
		<form id="form" name="form" role="form" method="post" action="/board/registerProc" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${lvo.id}"/>
			<div class="form-group">
               <label for="sminput">카테고리</label>
              	 <select id="cate_num" name="cate_num" class="search">
					<option value="">--카테고리 선택--</option>
					<c:forEach items="${cateList}" var="category">
						<option value="${category.cate_num}" <c:if
							test="${category.cate_num == board.cate_num}">selected="selected"</c:if>
							>${category.cate_kind}</option>
					</c:forEach>
				</select>
         	</div>
                           
           	<div class="form-group">
               <label for="sminput">제목</label>             
               <input type="text" style="text-align:center;" class="form-control" placeholder="제목을 입력해주세요!" name="title" maxlength="50">
            </div>

            
            <div class="form-group">
             	<label for="sminput">내용</label> 
                <textarea type="text" style="text-align:center;" class="form-control" placeholder="내용을 입력해 주세요!" name="content" maxlength="4000" style="height:350px;"></textarea>
            </div>
            
            <div class="form-group">
             	<label for="sminput">파일첨부</label>
                <div>
					 <input type="file" name="uploadFile"><br>
				</div>
				<div>
					<ul>
						<li>첨부가능 확장자 : JPG, JPEG, PNG, PDF, TXT</li>
						<li>첨부가능 총 용량 : 100Mbyte</li>
						<li>첨부 가능 개별 용량 : 100Mbyte</li>
					</ul>
				</div>
            </div>
                           


			<div style="text-align:center;">
				<button type="submit" class="btn btn-primary pull-right" id="register_btn">작성 완료</button>
				<button type="reset" class="btn btn-primary pull-right" id="reset_btn" onclick="location.href='/board/list'">작성 취소</button>
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