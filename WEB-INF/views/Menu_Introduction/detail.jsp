
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
	transform: scale(3);
}

100%{
transform
:scale(1)
;
}
}
.like-review .fa-heart {
	display: none;
}

.like-review .fa-heart.animate-like {
	display: inline-block;
}
</style>

<%@include file="../include/header.jsp"%>

<script>

function random(n) {
    return (Math.floor(Math.random()*100000)%6);
}
</script>


<div class="container" style="width: 100%; padding: 200px;">

	<div class="row text-center" style="padding-bottom: 50px;">
		<h4>동호회 상세보기</h4>
	</div>
	<div class="card mb-3" style="max-width: 100%;">
		<div class="row g-0">
			<div class="col-md-4">
				<div style="padding: 10px;">

					<script language="JavaScript">
									var ch = ${list.cate_num};
									if(ch == 01 ){
										console.log("카테고리 01 레저  : " + ch);
									    document.write( '<img src="../resources/images/레저'+random(4)
									    		 +'.jpg" width="300px" height="300px" border="0">');
									}else if(ch == 02){
										console.log("카테고리 02 운동  : " + ch);
									    document.write( '<img src="../resources/images/운동'+random(4)
									    		 +'.jpg" width="300px" height="300px" border="0">');
									}else if(ch == 03){
										console.log("카테고리 03 맛집 : " + ch);
									    document.write( '<img src="../resources/images/맛집'+random(4)
									    		 +'.jpg" width="300px" height="300px" border="0">');
									}else{
										console.log("카테고리 04 스터디 : " + ch);
									    document.write( '<img src="../resources/images/스터디'+random(4)
									    		 +'.jpg" width="300px" height="300px" border="0">');
									}
							    </script>
				</div>
			</div>
			<div class="col-md-8">
				<div class="row">
					<p class="col text-end" style="padding: 10px; margin-right: 20px;">
						<fmt:formatDate value="${list.apply_date}" pattern="yyyy-MM-dd" />
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
											id="floatingInputGroup1" value="${list.content}"
											placeholder="Username" readonly="readonly">
									</div>
								</div>
								<div class="row input-group" style="margin-bottom: 10px;">
									<div class="form-floating">
										<input type="text" class="form-control light"
											readonly="readonly"
											value=<c:if test="${list.cate_num eq '01'}">
												<c:out value="레저" />
											</c:if>
											<c:if test="${list.cate_num eq '02'}">
												<c:out value="운동" />
											</c:if>
											<c:if test="${list.cate_num eq '03'}">
												<c:out value="맛집" />
											</c:if>
											<c:if test="${list.cate_num eq '04'}">
												<c:out value="스터디" />
											</c:if>>
									</div>
								</div>
								<div class="row input-group" style="margin-bottom: 10px;">
									<div class="form-floating">
										<input type="text" name="meeting" class="form-control light"
											readonly="readonly" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 				<div class="like-content d-flex justify-content-end" style="margin-right: 30px; padding-bottom: 15px;">
       				 <button class="btn-secondary like-review" id="like">
           				 <div class="like-container">
                			<div class="like-cnt unchecked" id="like-cnt"></div>
           				 </div>
            			<i class="fa fa-heart" aria-hidden="true"></i> Like
        			</button>
    		</div>
 -->
			</div>
		</div>
	</div>
	<div class="card text-center">
		<div class="card-header">${list.club_name }</div>
		<div class="card-body">
			<p class="card-text">${list.content }</p>
		</div>
		<div class="card-footer text-muted">참가 인원 : ${list.count}</div>
	</div>
</div>


<
<script type="text/javascript">
	var time = ${list.meeting_time}; 
	var day= ${list.meeting_day};
	
	if(day == 0){
		$("input[name=meeting]").attr("value" , "매주 월요일 " + time + "시 ");
	}else if(day == 1){
		$("input[name=meeting]").attr("value" , "매주 화요일 " + time + "시 ");
	}else if(day == 2){
		$("input[name=meeting]").attr("value" , "매주 수요일 " + time + "시 ");
	}else if(day == 3){
		$("input[name=meeting]").attr("value" , "매주 목요일 " + time + "시 ");
	}else if(day == 4){
		$("input[name=meeting]").attr("value" , "매주 금요일 " + time + "시 ");
	}else if(day == 5){
		$("input[name=meeting]").attr("value" , "매주 토요일 " + time + "시 ");
	}else if(day == 6){
		$("input[name=meeting]").attr("value" , "매주 일요일 " + time + "시 ");
	}	
	
	 $(function () {
	        $('.like-review').on('click', function (e) {
	            $(this).children('.fa-heart').toggleClass('animate-like');

	        });
	    });
</script>

<%@include file="../include/footer.jsp"%>