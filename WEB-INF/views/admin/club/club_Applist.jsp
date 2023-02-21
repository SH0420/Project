a
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="../resources/css/boardcss.css">
<link href="../resources/css/Categroy.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">

<div class="container" style="padding-top: 100px;">


	<div class="row flex-lg-nowrap">

		<div class="col">


			<div class="row flex-lg-nowrap">
				<div class="col mb-3">
					<div class="e-panel card">


						<div class="card-body" style="margin-bottom: 533px;">
							<div class="card-title">
								<div class="container">
									<div class="row">
										<h6 class="col-9 mr-2">
											<small class="px-1">동호회 신청 목록 </small>
										</h6>
										<button onclick="location.href='/admin_club/registration'"
											style="margin: 10px;"
											class="col-2 btn btn-primary btn-sm d-flex jsutify-content-end text-center">
											신규 동호회 개설</button>

									</div>

									<div class="d-flex justify-content-start p-2">
										<div class="records">
											Showing: <b><c:out value="${total}"></c:out></b> result
										</div>
									</div>
								</div>
							</div>
							<div class="e-table">
								<div class="table-responsive table-lg mt-3">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="align-top text-center">번호</th>
												<th>신청자 이름</th>
												<th class="max-width">동호회 이름</th>
												<th>카테고리</th>
												<th class="sortable">신청일</th>
												<th></th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${club}" var="list">
												<tr>
													<td class="align-middle align-middle text-center"><c:out
															value="${list.rn}" /></td>
													<td class="align-middle align-middle"><c:out
															value="${list.name}" /></td>
													<td class="align-middle align-middle"><c:out
															value="${list.club_name}" /></td>
													<td class="align-middle align-middle"><c:out
															value="${list.cate_kind}" /></td>
													<td class="align-middle align-middle"><fmt:formatDate
															value="${list.apply_date}" pattern="yyyy-MM-dd" /></td>
													<td class="text-center align-middle">
														<div class="btn-group align-top">

															<button class="btn btn-sm btn-outline-secondary "
																type="button" data-bs-toggle="modal"
																style="margin-right: 5px;" data-backdrop="static"
																data-bs-target="#detail-modal" data-name="${list.name}"
																data-cate="${list.cate_kind}"
																data-club_name="${list.club_name}"
																data-content="${list.content}"
																data-day="${list.meeting_day}"
																data-time="${list.meeting_time}">상세보기</button>


															<!-- TODO : ajax 비동기 통신 처리 할 것   -->
															<button class="btn btn-sm btn-outline-secondary"
																type="button" data-bs-toggle="modal"
																style="margin-right: 5px;" data-backdrop="static"
																data-id="${list.id}"
																data-cno="${list.cno}" data-bs-target="#ok-modal">승인</button>
															<button class="btn btn-sm btn-outline-secondary "
																type="button" data-bs-toggle="modal"
																style="margin-right: 5px;" data-backdrop="static"
																data-cno="${list.cno}" data-bs-target="#no-modal">거절</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- detail Modal -->
<div class="modal fade" role="dialog" tabindex="-1" id="detail-modal">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세보기</h5>
				<button type="button" class="close" data-dismiss="modal">
					<!-- todo: x 닫기 이벤트 추가해야됨   -->
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="py-1">
					<form class="form" novalidate="">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col-3">
										<div class="form-group">
											<label>신청자 이름</label><input class="form-control"
												readonly="readonly" type="text" name="name" value="">
										</div>
									</div>
									<div class="col-1"></div>
									<div class="col-2">
										<div class="form-group">
											<label>카테고리</label> <input class="form-control"
												readonly="readonly" type="text" name="cate" value="">
										</div>
									</div>
									<div class="col-1"></div>
									<div class="col-2">
										<div class="form-group">
											<label>모임 요일</label> <input class="form-control" type="text"
												name="day" readonly="readonly" value="">
										</div>
									</div>
									<div class="col-1"></div>
									<div class="col-2">
										<div class="form-group">
											<label>모임 시간</label> <input class="form-control" type="text"
												name="time" readonly="readonly" value="">
										</div>
									</div>
								</div>
								<div class="row" style="padding-top: 10px;">
									<div class="col">
										<div class="form-group">
											<label>동호회 이름</label> <input class="form-control" type="text"
												name="cname" readonly="readonly" value="">
										</div>
									</div>
								</div>
								<div class="row" style="padding-top: 10px;">
									<div class="col mb-3">
										<div class="form-group">
											<label>Content</label>
											<textarea class="form-control" rows="5" readonly="readonly"
												name="content" placeholder=""></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col d-flex justify-content-end">
								<button class="btn btn-primary" type="button"
									data-bs-dismiss="modal">완료</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- ok Modal -->
<div class="modal fade" id="ok-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Check</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">해당 동호회를 등록 하시겠습니까?</div>
			<div class="modal-footer">
				<form action="/admin_club/update" method="POST">
					<input type="hidden" name="cno" value="" /> 
					<input type="hidden" name="status" value="01" />
					<input type="hidden" name="id" value="" />
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">확인</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- no Modal -->
<div class="modal fade" id="no-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Check</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">해당 동호회를 승인 거절 하시겠습니까?</div>
			<div class="modal-footer">
				<form action="/admin_club/update" method="POST">
					<input type="hidden" name="cno" value="" /> <input type="hidden"
						name="status" value="02" />
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">확인</button>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="left-side-bar2">
    <ul>
        <li><a  href="/admin_board/freelist">게시판관리</a></li>
		<li><a  href="/admin_board/qnalist">Q&A관리</a></li>
		<li><a href="/admin_member/management">회원 관리</a></li>
		<li><a  href="/admin_club/management">동호회 관리</a></li>
    </ul>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#detail-modal").on("show.bs.modal", function(e) {
        	
        	console.log("click");
				
   		    var name = $(e.relatedTarget).data('name');
            var cate = $(e.relatedTarget).data('cate');
            var day  = $(e.relatedTarget).data('day');
            var time= $(e.relatedTarget).data('time');
            var cname = $(e.relatedTarget).data('club_name');
            var content = $(e.relatedTarget).data('content');
			
            
            if(day == '0'){
            	 $("input[name=day]").attr("value", "매주 월요일");
            }else if(day == '1'){
            	 $("input[name=day]").attr("value", "매주 화요일");
            }else if(day == '2'){
            	 $("input[name=day]").attr("value", "매주 수요일");
            }else if(day == '3'){
            	 $("input[name=day]").attr("value", "매주 목요일");
            }else if(day == '4'){
            	 $("input[name=day]").attr("value", "매주 금요일");
            }else if(day == '5'){
            	 $("input[name=day]").attr("value", "매주 토요일");
            }else if(day == '6'){
            	 $("input[name=day]").attr("value", "매주 일요일");
            }
            
            $("input[name=name]").attr("value", name);
            $("input[name=cate]").attr("value", cate);
           
            $("input[name=time]").attr("value", time+"시");
            $("input[name=cname]").attr("value", cname);
            $("textarea[name=content]").attr("placeholder", content); 
        });
        
        $("#ok-modal").on("show.bs.modal", function(e) {
        	  var cno = $(e.relatedTarget).data('cno');
        	  var id = $(e.relatedTarget).data('id');
        	  
        	  console.log("cno : " + cno + typeof cno );
        	  console.log("id : " + id + typeof id);
        	  
        	  
        	  $("input[name=cno]").attr("value", cno);
        	  $("input[name=id]").attr("value", id);
        	
        });
        $("#no-modal").on("show.bs.modal", function(e) {
        	  var cno = $(e.relatedTarget).data('cno');
        	  $("input[name=cno]").attr("value", cno);
        });
    });
</script>




<%@include file="../include/footer.jsp"%>