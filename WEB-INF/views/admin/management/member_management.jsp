
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<link href="../resources/css/membercss.css" rel="stylesheet" />
<link href="../resources/css/Categroy.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/full.css">
<div class="container" style="padding-top: 150px;">

	<div class="row">
		<div class="col-12">
			<div class="card card-margin">
				<div class="card-body">
					<div class="row search-body">
						<div class="col-lg-12" style="margin-bottom: 375px;">
							<div class="search-result">
								<div class="result-header">
									<div class="row">
										<div class="col-lg-6">
											<div class="records">
												<div class="result-actions  d-flex justify-content-start">
													<div class="records m-3">
														<h4>
															<b>회원 정보 관리</b>
														</h4>
													</div>
												</div>
												<div class="result-actions  d-flex justify-content-start">
													<i> Member Total : </i><b><c:out value="${total}" /></b>
												</div>
											</div>
										</div>
										<div class="col-lg-6"></div>
									</div>
								</div>
								<div class="result-body">
									<div class="table-responsive">
										<table class="table widget-26">
											<tbody>
												<c:forEach items="${list}" var="member">
													<tr>
														<td>
															<div class="col-4 widget-26-job-title">
																<a href="#"> 사원 번호 : <c:out value="${member.empno}" />
																</a>
																<p class="m-0">
																	<a href="#" class="employer-name">이름</a> <span
																		class="text-muted time"><c:out
																			value="${member.name}" /></span>
																</p>
															</div>
														</td>
														<td>
															<div class="col-3 widget-26-job-info">
																<p class="type m-0">가입일자</p>
																<p class="text-muted m-0">
																	<span class="location"><fmt:formatDate
																			value="${member.regidate}" pattern="yyyy-MM-dd" /></span>
																</p>
															</div>
														</td>
														<td>
															<div class="col-3 widget-26-job-info">
																<p class="type m-0">활동 개수</p>
																<p class="text-muted m-0">
																	<span class="location"> <c:out
																			value="${member.count}" />
																	</span>
																</p>
															</div>
														</td>

														<td>
															<div class="widget-26-job-starred">
																<button class="btn btn btn-danger btn-xs " type="button"
																	data-bs-toggle="modal" data-bs-target="#delete-modal"
																	data-backdrop="static"
																	data-empno="${member.empno}"
																	data-id="${member.id}">
																	<i class="fa fa-trash-o" style="padding-right: 2px;"></i>삭제
																</button>
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



					<!-- 페이징 기능  -->
					<nav class="d-flex justify-content-center">
						<ul
							class="pagination pagination-base pagination-boxed pagination-square mb-0">
							<li class="page-item"><a class="page-link no-border"
								href="#"> <span aria-hidden="true">«</span> <span
									class="sr-only">Previous</span>
							</a></li>
							<li class="page-item active"><a class="page-link no-border"
								href="#">1</a></li>
							<li class="page-item"><a class="page-link no-border"
								href="#">2</a></li>
							<li class="page-item"><a class="page-link no-border"
								href="#">3</a></li>
							<li class="page-item"><a class="page-link no-border"
								href="#">4</a></li>
							<li class="page-item"><a class="page-link no-border"
								href="#"> <span aria-hidden="true">»</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
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
			<div class="modal-body">해당 회원을 정말 삭제하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<form action="delete" method="post">
					<input type="hidden" name="empno" value="" />
					<input type="hidden" name="id" value="" />
					<button type="submit" class="btn btn-danger">삭제하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="left-side-bar2">
    <ul>
        <li><a  href="/admin_board/freelist">게시판관리</a></li>
		<li><a  href="/admin_board/qnalist">Q&A관리</a></li>
		<li><a  href="/admin_club/applist">동호회등록</a></li>
		<li><a  href="/admin_club/management">동호회 관리</a></li>
    </ul>
</div>


<script type="text/javascript">
	$(document).ready(function() {
		$("#delete-modal").on("show.bs.modal", function(e) {
			var empno = $(e.relatedTarget).data('empno');
			var id = $(e.relatedTarget).data('id');
			
			$("input[name=empno]").attr("value", empno);
			$("input[name=id]").attr("value", id);
		});
	})
</script>

<%@include file="../include/footer.jsp"%>