
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="../resources/js/filejs.js"></script>
<link rel="stylesheet" href="../resources/css/btncss.css">
<link rel="stylesheet" href="../resources/css/filecss.css">
<link rel="stylesheet" href="../resources/css/full.css">


<div class="container" style="padding-top: 150px;">
	<div class="card" role="document" style="padding: 10px;">
		<div class="card-body">
			<div class="card-title">
				<h5 class="">공지사항 수정</h5>
			</div>
			<div class="">
				<div class="py-1">
					<form role="form" method="POST" autocomplete="off">
						<div class="row">
							<div class="col">

								<div class="row">
									<div class="col">
										<div class="form-group">
											<input type="hidden" id="bno" name="bno" value="${modify.bno}"/>
											<label>제목</label> <input class="form-control" id="title" name="title" type="text"
												value="<c:out value="${modify.title}" />">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>내용</label>
											<textarea id="content" name="content" class="form-control" rows="10" > <c:out value="${modify.content}" /> </textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col d-flex justify-content-center">
									<button
										class="button button--winona button--border-thin button--round-s"
										data-text="Click!" id="cancel_btn" >
										<span>작성 취소</span>
									</button>
									<button
										class="button button--winona button--border-thin button--round-s"
										data-text="Click!" type="submit" >
										<span>수정 완료</span>
									</button>
									
								   <script>
  
									   // 폼을 변수에 저장
									   var formObj = $("form[role='form']");
									   
									   // cancel 버튼 클릭
									   $("#cancel_btn").click(function(){
									    
										    formObj.attr("action", "/admin/freeread?bno=" + $("#bno").val());
										    formObj.attr("method", "get");    
										    formObj.submit();       
									    
									   });
								
								   </script>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>