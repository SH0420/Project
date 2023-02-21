
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/Club_Apply.css">
<link rel="stylesheet" href="../resources/css/full.css">
<div class="container" style="padding-top: 150px;">
	<div class="row"></div>
	<div class="row">
		<div class="col-lg-12">
			<form id='searchForm' action="/club/list" method='get'>
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>동호회명</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>카테고리</option>
				</select> <input type='text' name='keyword'
					value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='btn btn-default'>Search</button>
			</form>
		</div>

	</div>
</div>


<div class="container d-flexy justify-content_center board_list">
	<table class="table table-striped list_tbl" style="width: 100%;">
		<thead>
			<tr>
				<th>번 호</th>
				<th>카테고리</th>
				<th>동호회명</th>
				<th>게시일</th>
				<th>모임날짜</th>
				<th>인원수</th>
				<th class="text-center">신청하기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td class="align-middle align-middle "><c:out
							value="${list.cno}" /></td>
					<td class="align-middle align-middle "><c:if
							test="${list.cate_num eq '00'}">
							<c:out value="공지사항" />
						</c:if> <c:if test="${list.cate_num eq '01'}">
							<c:out value="레저" />
						</c:if> <c:if test="${list.cate_num eq '02'}">
							<c:out value="운동" />
						</c:if> <c:if test="${list.cate_num eq '03'}">
							<c:out value="맛집" />
						</c:if> <c:if test="${list.cate_num eq '04'}">
							<c:out value="스터디" />
						</c:if></td>
					<td class="align-middle align-middle "><c:out
							value="${list.club_name}" /></td>
					<td class="align-middle align-middle "><fmt:formatDate
							value="${list.apply_date}" pattern="yyyy-MM-dd" /></td>
					<td class="align-middle align-middle "><c:if
							test="${list.meeting_day eq '0'}">
							<c:out value="매주 월요일" />
						</c:if> <c:if test="${list.meeting_day eq '1'}">
							<c:out value="매주 화요일" />
						</c:if> <c:if test="${list.meeting_day eq '2'}">
							<c:out value="매주 수요일" />
						</c:if> <c:if test="${list.meeting_day eq '3'}">
							<c:out value="매주 목요일" />
						</c:if> <c:if test="${list.meeting_day eq '4'}">
							<c:out value="매주 금요일" />
						</c:if> <c:if test="${list.meeting_day eq '5'}">
							<c:out value="매주 토요일" />
						</c:if> <c:if test="${list.meeting_day eq '6'}">
							<c:out value="매주 일요일" />
						</c:if></td>
					<td class="align-middle align-middle "><c:out
							value="${list.count}" /></td>
					<form id='countForm' action="/club/update" method="POST">
						<td class="text-center">
							<button onclick="alert('신청되었습니다.')" type="submit"
								class="btn btn-sm btn-outline-secondary ani-button">신청하기
							</button> <input type='hidden' name='cno'
							value='<c:out value="${list.cno}"/>' /> <!-- TODO : 실제 로그인된 아이디 값으로 변경  -->
							<input type="hidden" name="id" value="${lvo.id}" />
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 페이징 처리부분 -->
<div class='d-flex justify-content-center'>
	<ul class="pagination mt-3 mb-0">

		<c:if test="${pageMaker.prev}">
			<li class="paginated_button previous"><a
				href="/club/list?pageNum=${pageMaker.startPage -1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li
				class="paginated_button ${pageMaker.cri.pageNum == num ? 'active':''} ">
				<a href="/club/list?pageNum=${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginated_button next"><a
				href="/club/list?pageNum=${pageMaker.endPage +1 }">Next</a></li>
		</c:if>
	</ul>
</div>
<!--  end Pagination -->
<form id='actionForm' action="/club/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type'
		value='<c:out value="${ pageMaker.cri.type}"/>'> <input
		type='hidden' name='keyword'
		value='<c:out value="${ pageMaker.cri.keyword}"/>'>
</form>

<script type="text/javascript">

$(document).ready(function(){
	var actionFrom = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		
	if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		} 
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});	
	
 	/* var searchForm = $("#countForm");
	
	$("#countForm button").on("click", function(e){
		
		searchForm.find("input[name='count_cno']").val($(this).attr("href"));
		actionForm.submit();
	});	  */
	
/*  	var countForm = $("#countForm");
	
	$("#countForm button").on("click", function(e){
		$('#moveMove').on('click', function(){
			location.href ="/board/update"
		}); */
	
});
	


</script>
<%@include file="../include/footer.jsp"%>