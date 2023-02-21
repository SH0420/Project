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
						<div class="card-body">
							<div class="card-title">
								<div class="container">
									<div class="row m-3">
										<h6 class="col-11 mr-2">
											<small class="px-1">동호회 관리</small>
										</h6>
									</div>
								</div>
							</div>
							<div class="e-table">
								<div class="table-responsive table-lg mt-3">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="align-top">번호</th>
												<th>동호회 이름</th>
												<th class="max-width">카테고리</th>
												<th class="sortable">시작일</th>
												<th class="sortable">모임 시간</th>
												<th class="sortable text-center">인원</th>
												<th class="text-center">관리</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${club}" var="list">
												<tr style="height: 50px;">
													<td class="align-middle align-middle text-center"><c:out
															value="${list.rn}" /></td>
													<td class="align-middle align-middle"><a href="/admin_club/detail?cno=${list.cno}">
													<c:out value="${list.club_name}" /></a></td>
													<td class="align-middle align-middle"><c:out
															value="${list.cate_kind}" /></td>
													<td class="align-middle align-middle"><fmt:formatDate
															value="${list.apply_date}" pattern="yyyy-MM-dd" /></td>
													<td class="align-middle align-middle"><c:choose>
															<c:when test="${list.meeting_day eq '0'}">매주 월요일</c:when>
															<c:when test="${list.meeting_day eq '1'}">매주 화요일</c:when>
															<c:when test="${list.meeting_day eq '2'}">매주 수요일</c:when>
															<c:when test="${list.meeting_day eq '3'}">매주 목요일</c:when>
															<c:when test="${list.meeting_day eq '4'}">매주 금요일</c:when>
															<c:when test="${list.meeting_day eq '5'}">매주 토요일</c:when>
															<c:when test="${list.meeting_day eq '6'}">매주 일요일</c:when>
														</c:choose> <c:out value=" ${list.meeting_time}시" /></td>
													<td class="align-middle align-middle text-center"><c:out
															value="${list.count}" /></td>
													<td class="text-center align-middle">
														<div class="btn-group align-top">
															
														
															<form action="/admin_club/waittingClub" method="GET">
																<input type="hidden" name="cno" value="${list.cno}" />
																<button class="btn btn-sm btn-outline-secondary"
																	style="margin-right: 5px; height: 100%;" type="submit"
																	data-bs-toggle="modal" data-bs-target="#alert-modal">삭제
																	안내</button>
															</form>
															
															<button style="height: 39px;"
																class="btn btn-sm btn-outline-secondary" type="button"
																data-bs-toggle="modal" data-backdrop="static"
																data-cno="${list.cno}" data-count="${list.count}"
																data-bs-target="#delete-modal">삭제</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="d-flex justify-content-end">
									<div class="records">
										Showing: <b> <c:out
												value="${(pageMaker.cri.pageNum -1) * pageMaker.cri.amount + 1}" />
											- <c:choose>
												<c:when test="${pageMaker.total < 10}">
													<b><c:out value="${pageMaker.total}" /></b>
												</c:when>
												<c:otherwise>
													<b><c:out
															value="${pageMaker.cri.pageNum * pageMaker.cri.amount}" />
													</b>
												</c:otherwise>
											</c:choose>
										</b>
									</div>
								</div>

								<!-- 페이징 기능  -->
								<div class='d-flex justify-content-center pull-right'
									style="width: 100%;">
									<ul class="pagination mt-3 mb-0">
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button previous"><a
												class="page-link" href="${pageMaker.startPage-1 }">
													Previous</a></li>
										</c:if>

										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":""} ">
												<a class="page-link" href="${num}">${num}</a>
											</li>
										</c:forEach>

										<c:if test="${pageMaker.next }">
											<li class="paginate_button next"><a class="page-link"
												href="${pageMaker.endPage +1 }">NEXT</a></li>
										</c:if>
									</ul>
								</div>

								<form id='actionForm' action="/admin_club/management"
									method='get'>
									<input type='hidden' name='pageNum'
										value='${pageMaker.cri.pageNum}'> <input type='hidden'
										name='amount' value='${pageMaker.cri.amount}'>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- delete Modal -->
<div class="modal fade" id="delete-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input class="form-control" id="sminput" type="text" name="count"
					readonly="readonly" value="" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<form action="/admin_club/delete" method="get">
					<input type="hidden" name="cno" value="" />
					<button type="submit" class="btn btn-danger">삭제하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="alert-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">삭제 안내문 발송</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">해당 동호회 사람들에게 삭제 안내문을 보냈습니다.</div>
			<div class="modal-footer">
				<button type="submit" data-bs-dismiss="modal"
					class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="left-side-bar2">
    <ul>
        <li><a  href="/admin_board/freelist">게시판관리</a></li>
		<li><a  href="/admin_board/qnalist">Q&A관리</a></li>
		<li><a href="/admin_member/management">회원 관리</a></li>
		<li><a  href="/admin_club/applist">동호회등록</a></li>
    </ul>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#delete-modal").on("show.bs.modal", function(e) {
        	  var count = $(e.relatedTarget).data('count');
        	  var cno = $(e.relatedTarget).data('cno');
        	  
        	  $("input[name=cno]").attr("value", cno );
        	  
        	  
        	  if(count != 0){
	        	  $("input[name=count]").attr("value", count+"명의 사람이 가입되어있습니다. 정말 삭제하시겠습니까 ? ");
        	  }else{
        		  $("input[name=count]").attr("value", "해당 동호회를 정말 삭제 하시겠습니까 ?");
        	  }
        });
        
    	var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1")
			e.preventDefault();
			searchForm.submit();
		});
    });
</script>




<%@include file="../include/footer.jsp"%>