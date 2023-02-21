
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/css/full.css">

<style>
.like-content {
	display: inline-block;
	width: 100%;
	font-size: 18px;
	border-top: 10px dashed #eee;
	text-align: center;
}

.like-content span {
	color: #9d9da4;
	font-family: monospace;
}

.like-content .btn-secondary {
	display: block;
	text-align: center;
	background: #ed2553;
	border-radius: 3px;
	box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
	padding: 7px 12px;
	font-size: 18px;
	margin: 10px 5px 0px 0px;
	cursor: pointer;
	border: none;
	outline: none;
	color: #ffffff;
	text-decoration: none;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.like-content .btn-secondary:hover {
	transform: translateY(-3px);
}

.like-content .btn-secondary .fa {
	margin-right: 5px;
}

.animate-like {
	animation-name: likeAnimation;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
	animation-duration: 0.65s;
}

@
keyframes likeAnimation { 0% {
	transform: scale(30);
}
100%
{
transform




:


 


scale




(1);
}
}
</style>


<%@include file="../include/header.jsp"%>

<div class="container" style="width: 100%; padding: 200px;">

	<div class="row text-center" style="padding-bottom: 50px;">
	</div>
	<div class="card mb-3" style="max-width: 100%;">
		<div class="row g-0">
			<div class="col-md-4">
				<div style="padding: 10px;">
					<img src="../resources/images/horse.jpg"
						class="img-fluid rounded-start"
						style="width: 300px; height: 300px;">
				</div>
			</div>
			<div class="col-md-8">
				<div class="row">
					<p class="col text-end" style="padding: 10px; margin-right: 20px;">
						<fmt:formatDate value="${detail.apply_date}" pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="card-body">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div>
								<div class="row input-group" style="margin-bottom: 10px;">
									<div class="form-floating">
										<input type="text" class="form-control light"
											id="floatingInputGroup1" placeholder="Username"
											readonly="readonly" value="${detail.club_name }">
									</div>
								</div>
								<div class="row input-group" style="margin-bottom: 10px;">
									<div class="form-floating">
										<input type="text" class="form-control light"
											id="floatingInputGroup1" placeholder="Username"
											readonly="readonly" value="${detail.cate_kind }">
									</div>
								</div>
								<div class="row input-group" style="margin-bottom: 10px;">
									<div class="form-floating">
										<input type="text" id="metting" class="form-control light"
											id="floatingInputGroup1" placeholder="Username"
											readonly="readonly" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="like-content d-flex justify-content-end"
					style="margin-right: 30px; padding-bottom: 15px;"></div>
			</div>
		</div>
	</div>

	<div class="card text-center">
		<div class="card-header"></div>
		<div class="card-body">
			<p class="card-text">
				<c:out value="${detail.content }" />
			</p>
		</div>
		<div class="card-footer text-muted">
			<p>
				좋아요 : <b><c:out value="${detail.like_count }" /></b>
			</p>
			<p>
				활동 인원 : <b><c:out value="${detail.count }" /></b>
			</p>
			 <c:if test="${!empty member}">
				<table class="table table-bordered">
				<thead>
					<tr>
						<th class="align-top text-center">사원 번호</th>
						<th class="align-top text-center">이름</th>
						<th class="align-top text-center">아이디</th>
						<th class="align-top text-center">핸드폰</th>
						<th class="align-top text-center">활동일</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach items="${member}" var="list">
						<tr>
							<td class="align-middle align-middle text-center"> ${list.empno}</td>
							<td class="align-middle align-middle text-center"> ${list.name}</td>
							<td class="align-middle align-middle text-center"> ${list.id}</td>
							<td class="align-middle align-middle text-center"> ${list.phonenum}</td>
							<td class="align-middle align-middle text-center"> ${list.app_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if> 
		</div>
	</div>
	<div class="container">
		<div class="row">
			<button class="btn btn-primary"
				onclick="location.href='/admin_club/management'">목록보기</button>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		var applyDate = ${list.app_date};
		const today = new Date().getTime();
		console.log("Apply Date : " + applyDate);
		console.log("Today : " + today);
		
	})
</script>


<%@include file="../include/footer.jsp"%>