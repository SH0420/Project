
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>

<style>
* {
	margin-bottom: 3px;
}
</style>
<link rel="stylesheet" href="../resources/css/btncss.css">
<link rel="stylesheet" href="../resources/css/inputcss.css">
<link rel="stylesheet" href="../resources/css/NewClub.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<div class="container" style="padding-top: 150px;">
	<div class="row">
		<div class="col d-flex justify-content-center">

			<div class="col-lg-12 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-lg-12 col-sm-12 col-xs-12">
						<div class="widget">
							<div class="widget-header bordered-top bordered-palegreen">
								<span class="widget-caption text-center"> 신규 동호회 신청 </span>
							</div>
							<div
								class="widget-header bordered-top bordered-palegreen widget_no_paddding">
								<h4 class="scheme-g text-center">신청 시 주의 사항</h4>
								<textarea readonly
									style="font-size: 1em; width: 100%; height: 150px;">
										【 동아리 신청 방법 】

									1. 신청하고자 하는 프로그램 확인 후 프로그램 명 작성하기!
									
									2. 신청하고자 하는 프로그램에 대한 내용을 상세하게 작성한다.
									
									3. 신청하고자 하는 프로그램 내용 작성 후 신청하기 클릭한다.
									
									4. 동호회이름, 신청일, 카테고리,모임주기 등 상세하게 입력한다.
									
									※신청이유를 정확하게 입력하지않으면 취소처리됩니다.
									
									5. 신청 후 신청내역 확인을 위해 신청한 프로그램을 클릭 후 신청내역 보기 확인가능!
									
									
									. 자신이 신청한 프로그램과 접수한 내용 사항을 꼼꼼하게 확인
									
									 (확인 후 프로그램 취소를 원할 경우 신청 시 입력한 비밀번호를 다시 입력 후 취소신청을 클릭합니다.)

									</textarea>
							</div>

							<div class="widget-body">
								<form method="post" action="/club/apply">
									<div class="form-group">
										<label for="name"> 신청자 </label> <input type="text"
											readonly="readonly" class="form-control input-xs" id="id"
											name="id" value="${lvo.id}">
									</div>

									<div class="form-group">
										<label for="club_name">동호회이름</label> <input type="text"
											name="club_name" class="form-control input-xs" id="club_name"
											value="" placeholder="입력해주세요 ">
									</div>

									<div class="form-group">
										<label for="sminput">신청일</label> <input type="date"
											class="form-control input-sm" id="apply_date">
									</div>
									<div class="container">
										<div class="row"></div>
									</div>
									<div class="form-group">
										<div class="container">
											<div class="row">
												<div class="col-md-2">
													<p>카테고리</p>
												</div>
												<div class="col-md-4">
													<select class="select" style="width: 90%;" id="cate_num"
														name="cate_num">
														<option disabled selected>---선택---</option>
														<option value="01">레저</option>
														<option value="02">운동</option>
														<option value="03">맛집</option>
														<option value="04">스터디</option>
													</select>
												</div>
												<div class="col-md-2">
													<p class="text-center">모임 주기</p>
												</div>
												<div class="col-md-4">
													<div class="row" style="padding: 3px;">
														<div class="col-md-5">
															<select class="form-control" id="meeting_day"
																name="meeting_day">
																<option value="">요일을 선택해주세요</option>
																<option value="0">매주 월요일</option>
																<option value="1">매주 화요일</option>
																<option value="2">매주 수요일</option>
																<option value="3">매주 목요일</option>
																<option value="4">매주 금요일</option>
																<option value="5">매주 토요일</option>
																<option value="6">매주 일요일</option>
															</select>
														</div>
														<div class="col-md-5">
															<select class="form-control" id="meeting_time"
																name="meeting_time">
																<option selected>모임 시간을 선택해주세요</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<label for="sminput"> 동호회신청서 </label>
									<div class="form-group">
										<textarea style="width: 100%;" id="content" name="content"
											placeholder="동호회 활동을 적어주세요 " rows="5"></textarea>
									</div>
									<div class="row">
										<div class="col d-flex justify-content-center">
											<button
												class="button button--winona button--border-thin button--round-s"
												data-text="Click" type="reset">
												<span>작성취소</span>
											</button>
											<button
												class="button button--winona button--border-thin button--round-s"
												data-text="Click" type="submit">
												<span>신청하기</span>
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
	$(document).ready(
			function() {
				// 모임 시간 
				for (var i = 6; i <= 20; i++) {
					$('#meeting_time').append(
							'<option value="' + i + '">' + i + '시</option>');
				}
			});
</script>
<script type="text/javascript">
	document.getElementById('apply_date').value = new Date().toISOString()
			.substring(0, 10);
</script>

<%@include file="../include/footer.jsp"%>