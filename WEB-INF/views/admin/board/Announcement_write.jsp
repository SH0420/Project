
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
				<h5 class="">공지사항 작성</h5>
			</div>
			<div class="">
				<div class="py-1">
					<form  id="form" method="post">
						<div class="row">
							<div class="col">

								<div class="row">
									<div class="col">
										<div class="form-group">
											<label>제목</label> <input class="form-control" type="text" id="title" name="title"
												placeholder="제목을 입력해주세요">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col mb-3">
										<div class="form-group">
											<label>내용</label>
											<textarea class="form-control" rows="10" id="content" name="content"
												placeholder="공지사항 내용을 입력해주세요"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
		
						<div class="row">
							<div class="col d-flex justify-content-center">
									<button
										class="button button--winona button--border-thin button--round-s"
										data-text="Click!"
										onclick="location.href='/admin/freelist'">
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
<%@include file="../include/footer.jsp"%>