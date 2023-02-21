a
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="../resources/css/boardcss.css">
<link rel="stylesheet" href="../resources/css/Categroy.css">
<link rel="stylesheet" href="../resources/css/full.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">

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
											<small class="px-1">Q&A 게시판 관리</small>
										</h6>
									</div>
								</div>
							</div>

							<div class="e-table">
								<div class="table-responsive table-lg mt-3">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="align-top text-center">번호</th>
												<th>유형</th>
												<th class="max-width">제목</th>
												<th>작성자</th>
												<th class="sortable">작성일</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${qnaList}" var="qnaboard">
												<tr>
													<td class="align-middle align-middle text-center "><c:out
															value="${qnaboard.rn}" /></td>
													<td class="align-middle align-middle "><c:out
															value="${qnaboard.cate_kind}" /></td>
													<td class="align-middle align-middle"><c:out
																value="${qnaboard.title}" /></td>
													<td class="align-middle align-middle"><c:out
															value="${qnaboard.id}" /></td>
													<td class="align-middle align-middle"><fmt:formatDate
															value="${qnaboard.reg_date}" pattern="yyyy-MM-dd" /></td>
													<td class="text-center align-middle">
														<div class="btn-group align-top">
															
															<c:choose>
																<c:when test="${qnaboard.ans_type eq 1 }">
																<!-- POST - SQL update   -->
																	<button class="btn btn-sm btn-outline-secondary "
																	type="button" data-bs-toggle="modal"
																	data-bs-target="#edit-modal"
																	data-backdrop="static" 
																	data-bno= "${qnaboard.bno}"
																	data-cate="${qnaboard.cate_kind}"
																	data-id="${qnaboard.id}"
																	data-title="${qnaboard.title}"
																	data-content="${qnaboard.content}"
																	data-reply="${qnaboard.reply }"
																	>수정</button>
																</c:when>
																<c:otherwise>
																<!-- POST - SQL insert   -->
																	<button class="btn btn-sm btn-outline-secondary "
																	type="button" data-bs-toggle="modal"
																	data-bs-target="#answer-modal"
																	data-backdrop="static" 
																	data-bno= "${qnaboard.bno}"
																	data-cate="${qnaboard.cate_kind}"
																	data-id="${qnaboard.id}"
																	data-title="${qnaboard.title}"
																	data-content="${qnaboard.content}"
																	>답변</button>
																</c:otherwise>
															</c:choose>
															<button class="btn btn-sm btn-outline-secondary "
																type="button" data-bs-toggle="modal"
																data-bno= "${qnaboard.bno}"
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
											Showing: <b>
												<c:out value="${(pageMaker.cri.pageNum -1) * pageMaker.cri.amount + 1}" /> -
												<c:out value="${pageMaker.cri.pageNum * pageMaker.cri.amount}" /> 
												</b> of <b><c:out value="${pageMaker.total}" /></b> result
										</div>
									</div>

										<!-- 페이징 기능  -->
									<div class='d-flex justify-content-center pull-right' style="width:100%;">
										<ul class="pagination mt-3 mb-0">
											<c:if test="${pageMaker.prev}">
												<li class="paginate_button previous"><a  class="page-link"
													href="${pageMaker.startPage-1 }"> Previous</a></li>
											</c:if>

											<c:forEach var="num" begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}">
												<li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":""} ">
													<a  class="page-link" href="${num}">${num}</a>
												</li>
											</c:forEach>

											<c:if test="${pageMaker.next }">
												<li class="paginate_button next"><a  class="page-link"
													href="${pageMaker.endPage +1 }">NEXT</a></li>
											</c:if>
										</ul>
									</div>

									<form id='actionForm' action="/admin_board/freelist" method='get'>
										<input type='hidden' name='pageNum'
											value='${pageMaker.cri.pageNum}'>  <input
											type='hidden' name='amount' value='${pageMaker.cri.amount}'>
										<input type='hidden' name='type'
											value='<c:out value="${pageMaker.cri.type}"/>'> <input
											type='hidden' name='keyword'
											value='<c:out value="${pageMaker.cri.keyword}"/>'>
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
			<div class="modal-body">해당 문의 글을 정말 삭제하시겠습니까?</div>
			<div class="modal-footer">
				<form method="POST" action="/admin_board/qnadelete">
					<input type="hidden" value="" id="bno" name="bno"/>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-danger">삭제하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- edit Modal -->
<div class="modal fade" role="dialog" tabindex="-1" id="edit-modal">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
						<h5 class="modal-title">답변 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="py-1">
					<form class="form" action="/admin_board/qnaupdate" method="POST">
						<input type="hidden" id="bno" name="bno" value=""/>
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label>유형</label><input class="form-control"
												readonly="readonly" type="text" name="cate">
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label>작성자</label> <input class="form-control"
												readonly="readonly" type="text" name="ida"
												value="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label>제목</label> <input class="form-control" type="text" name ="title"
												readonly="readonly" value="더 많은 활동을 추가해주세요.">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>상세 내용</label>
											<textarea class="form-control" rows="5" name="content" placeholder=""
												readonly="readonly"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>답변</label>
											<input class="form-control" type="text" value="" id="reply" name="reply" 
												style="width:100%; height:100px;"/>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col d-flex justify-content-end">
								<button class="btn btn-primary" type="submit">완료</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- answer Modal -->
<div class="modal fade" role="dialog" tabindex="-1" id="answer-modal">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
						<h5 class="modal-title">답변하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="py-1">
					<form class="form" action="/admin_board/qnawrite" method="POST">
						
						<input type="hidden" id="bno" name="bno" value=""/>
						<input type="hidden" id="reply" name="reply" value=""/>
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label>유형</label><input class="form-control"
												readonly="readonly" type="text" name="cate">
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label>작성자</label> <input class="form-control"
												readonly="readonly" type="text" name="ida"
												value="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label>제목</label> <input class="form-control" type="text" name ="title"
												readonly="readonly" value="더 많은 활동을 추가해주세요.">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>상세 내용</label>
											<textarea class="form-control" rows="5" name="content" placeholder=""
												readonly="readonly"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>답변</label>
											<textarea id="reply" name="reply" class="form-control" rows="5"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col d-flex justify-content-end">
								<button class="btn btn-primary" type="submit">완료</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<div class="left-side-bar2">
    <ul>
        <li><a  href="/admin_board/freelist">게시판관리</a></li>
		<li><a href="/admin_member/management">회원 관리</a></li>
		<li><a  href="/admin_club/applist">동호회등록</a></li>
		<li><a  href="/admin_club/management">동호회 관리</a></li>
    </ul>
</div>


<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#answer-modal").on("show.bs.modal", function(e) {
            var bno = $(e.relatedTarget).data('bno');
            var cate = $(e.relatedTarget).data('cate');
            var ida = $(e.relatedTarget).data('id');
            var title = $(e.relatedTarget).data('title');
            var content  = $(e.relatedTarget).data('content');
			
            
            $("input[name=bno]").attr("value", bno);
            $("input[name=cate]").attr("value", cate);
            $("input[name=ida]").attr("value", ida);
            $("input[name=title]").attr("value", title);
            $("textarea[name=content]").attr("placeholder", content);
        });
        
        $("#edit-modal").on("show.bs.modal", function(e) {
            var bno = $(e.relatedTarget).data('bno');
            var cate = $(e.relatedTarget).data('cate');
            var ida = $(e.relatedTarget).data('id');
            var title = $(e.relatedTarget).data('title');
            var content  = $(e.relatedTarget).data('content');
            var reply  = $(e.relatedTarget).data('reply');
          	
            $("input[name=bno]").attr("value", bno);
            $("input[name=cate]").attr("value", cate);
            $("input[name=ida]").attr("value", ida);
            $("input[name=title]").attr("value", title);
            $("input[name=reply]").attr("value", reply);
            $("textarea[name=content]").attr("placeholder", content);
        });
        
        $("#delete-modal").on("show.bs.modal", function(e) {
            var bno = $(e.relatedTarget).data('bno');
            $("input[type=hidden]").attr("value", bno);
        });
        
        
        $("button[type=submit]").on('click' , function(){
        	var textarea = document.getElementById('#reply').val();
        	$("input[name=reply]").attr("value", teatarea);
        });
    });
</script>


<%@include file="../include/footer.jsp"%>