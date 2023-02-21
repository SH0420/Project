
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/full.css">

<div class="container" style="margin-top: 100px;">
	<img src="../resources/images/hyerim.jpg" width="96.4%" height="400px"
		style="margin-left: 24px">
	<div class="container">

		<div class="container">
			<div class="row">
				<form role="form" name="read" method="POST" autocomplete="off">
					<table class="table table-striped" border :1pxsolid#dddddd" >
						<%-- 홀,짝 행 구분 --%>
						<tbody>
							<tr>
								<div class="form-check form-check-inline mt-3"
									style='float: right';">
									<input class="form-check-input" type="checkbox"
										name="secret_type" id="secret_type" value="1"> <label
										class="form-check-label">비밀글 설정</label>
								</div>
							</tr>
							<tr>
								<td>게시글 번호 : ${board.bno}</td>
								<%-- <input class="form-control" name="bno" value='<c:out value="${ board.bno }" />' readonly="readonly" /> --%>
							</tr>
							<tr>
								<td>카테고리 : <select id="cate_num" name="cate_num">
										<option>--카테고리 선택--</option>
										<c:forEach items="${cateList}" var="category">
											<option value="${category.cate_num}"
												<c:if test="${category.cate_num == board.cate_num}">selected="selected"</c:if>>${category.cate_kind}</option>
										</c:forEach>
								</select>
								</td>
								<%-- <input type="hidden" name="cate_num" value="${ board.cate_num }" /> --%>
							</tr>
							<tr>
								<td>제목: <textarea type="text" class="form-control"
										name="title">${board.title}</textarea>
								</td>
								<%-- <input type="hidden" name="title" value="${ board.title }" /> --%>
							</tr>
							<td>작성자 : ${board.id} | 작성일 : ${board.reg_date} <c:if
									test="${!empty board.mod_date}">
								| 수정일  : ${board.mod_date}
							</c:if></td>
							<tr>
								<td>내용 : <textarea type="text" class="form-control"
										name="content" maxlength="4000" style="height: 350px;">${board.content}</textarea>
								</td>
							</tr>
						</tbody>
						<div></div>
					</table>

					<div class="container"
						style="border: 1px solid black; padding: 10px; margin-top: 20px;">
						<div style="padding: 5px;">답변</div>
						<textarea
							style="background-color: #dee2e6; width: 100%; height: 100px; overflow-y: scroll"
							readonly="readonly" placeholder="${reply.reply}"></textarea>
					</div>
					<br>

					<div class="btn-group" role="group" aria-label="Basic example"
						style="text-align: end;">
						<!-- 로그인 유저랑 일치하는지 확인된 본인만 수정/삭제가 가능 -->
						<c:if test="${board.id == lvo.id }">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#modifyModal" onclick="clickMod()">수정</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#deleteModal" onclick="clickDel()">삭제</button>
						</c:if>
						<button type="reset" class="btn btn-primary"
							onclick="history.back()">목록보기</button>
					</div>

				</form>
				<!-- Delete-Modal -->
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<p>게시물을 정말 삭제하시겠습니까?</p>
							</div>

							<div class="modal-footer">
								<input type="hidden" name="bno" value="${board.bno }" />
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal"
									onclick="location.href='/qnaboard/qnalist'">취소</button>
							</div>

						</div>
					</div>
				</div>

				<!-- Modify-Modal -->
				<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">게시물 수정</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<p>게시물을 수정하시겠습니까?</p>
							</div>

							<div class="modal-footer">
								<input type="hidden" name="bno" value="${board.bno }" />
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal"
									onclick="location.href='/qnaboard/qnalist'">취소</button>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!--end btn-group -->

			</form>
		</div>
	</div>

	<script type="text/javascript">
		function clickDel() {
			document.read.action = "/qnaboard/delete";
			document.read.submit();
		}

		function clickMod() {
			document.read.action = "/qnaboard/update";
			document.read.submit();
		}
	</script>

	<%@include file="../include/footer.jsp"%>