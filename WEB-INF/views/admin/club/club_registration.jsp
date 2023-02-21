
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/btncss.css">
<link rel="stylesheet" href="../resources/css/full.css">
<link rel="stylesheet" href="../resources/css/inputcss.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">


<div class="container" style="padding-top: 150px;">
	<div class="row">
		<div class="col d-flex justify-content-center">

			<div class="col-lg-12 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-lg-12 col-sm-12 col-xs-12" style="margin-bottom: 378px;">
						<div class="widget">
							<div class="widget-header bordered-top bordered-palegreen">
								<span class="widget-caption"> 신규 동호회 등록 </span>
							</div>
							<div class="widget-header bordered-top bordered-palegreen">
								<span class="widget-caption"> * 새로운 동호회를 등록하기위해 아래의 입력사항을
									전부 입력해주세요 * </span>
							</div>
							<div class="widget-body">
							
							
								<form method="post" action="/admin_club/registration">
									<div class="form-group">
										<label for="sminput">동호회 이름 </label> <input type="text" name="club_name"
											class="form-control input-xs" id="sminput"
											placeholder="동호회 이름을 입력해주세요">
									</div>
									<div class="form-group">
										<label for="sminput">동호회 내용 </label> <textarea cols="5" name="content"
											class="form-control input-xs" id="sminput"
											placeholder="동호회 설명을 입력해주세요"></textarea>
									</div>
									<div class="form-group">
										<label for="sminput"> 카테고리 </label> <select 
											class="form-control" id="exampleFormControlSelect1" name="cate_num">
											<option value="">카테고리를 선택해주세요</option>
											<option value="01">운동</option>
											<option value="02">여행</option>
											<option value="03">맛집</option>
											<option value="04">레저</option>
										</select>
									</div>
									<!-- <div class="form-group">
										<label for="sminput">게시일</label> 
										
										<input type="date" name="apply_date"
											class="form-control input-sm" id="currentDate"
											pattern="yyyy/MM/dd"
											placeholder="Extra Small Input">
									</div> -->
									<div class="form-group">
										<label for="sminput"> 모임 주기 </label>
										<div class="row">
											<div class="col">
												<select class="form-control" id="day" name="meeting_day">
													<option value="" selected>요일을 선택해주세요</option>
													<option value="0">매주 월요일</option>
													<option value="1">매주 화요일</option>
													<option value="2">매주 수요일</option>
													<option value="3">매주 목요일</option>
													<option value="4">매주 금요일</option>
													<option value="5">매주 토요일</option>
													<option value="6">매주 일요일</option>
												</select>
											</div>
											<div class="col">
												<select class="form-control" id="time" name="meeting_time">
													<option selected>모임 시간을 선택해주세요</option>
												</select>
											</div>
										</div>
									</div>
									<input type="hidden" name="id" value="Yang"/>

									<div class="row">
										<div class="col d-flex justify-content-center">
											<button
												class="button button--winona button--border-thin button--round-s"
												type="button" data-text="Click!" onclick="location.href='/admin_club/applist'">
												<span>작성취소</span>
											</button>
											<button
												class="button button--winona button--border-thin button--round-s"
												data-text="Click!" type="submit">
												<span>저장하기</span>
											</button>
										</div>

									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	document.getElementById('currentDate').value = new Date().toISOString()
			.substring(0, 10);
</script>

<script>
$(document).ready(function(){ 
	    // 모임 시간 
	    for(var i=6; i <= 20; i++) {
	        $('#time').append('<option value="' + i + '">' + i+ '시</option>');    
	    }
});
</script>


<%@include file="../include/footer.jsp"%>