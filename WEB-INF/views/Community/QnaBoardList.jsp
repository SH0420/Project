<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<!-- <link rel="stylesheet" href="../../resources/css/Main.css"> -->

<!-- <link rel="stylesheet" href="../resources/css/bootstrap.min_1.css"> -->
<link rel="stylesheet" href="../resources/css/swiper.css">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/respon.css">
<link rel="stylesheet" href="../resources/css/full.css">

<div class="container" style="padding-top: 150px;">
	<img src="../resources/images/hyerim.jpg" width="100%" height="300px">
</div>

<div class="content respon2">
	<form id="listForm" action="/qnaboard/qnalist" method="post">
		<!-- <div class="table-group"> -->
		<section class="list_box">
			<!-- <div class="container text-center"> -->
			<div class="board_list">
				<div class="row">
					<div class="list_searchbox">
						<div class="total_num"></div>
						<div class="search_group mbNone">
							<select id="cate_num" name="cate_num" style="margin-right: 7px;">
								<option value="">카테고리 검색</option>
								<c:forEach items="${cateList}" var="category">
									<option value="${category.cate_num}"
										<c:if test="${category.cate_num == board.cate_num}">selected="selected"</c:if>>${category.cate_kind}</option>
								</c:forEach>
							</select>
							<!-- <select name="type" data-msg="선택해주세요." required> -->
							<select name="type" style="margin-right: 7px;">
								<option value=""
									<c:if test="${board.type == ''}">selected="selected"</c:if>>전체검색</option>
								<option value="title"
									<c:if test="${board.type == 'title'}">selected="selected"</c:if>>제목</option>
								<option value="content"
									<c:if test="${board.type == 'content'}">selected="selected"</c:if>>내용</option>
							</select> <input type="text" name='keyword'
								value='<c:out value="${ board.keyword }" />'
								style="margin-right: 7px;" data-msg="입력해주세요." />
							<!--  required -->
							<input type='hidden' name='pageNum'
								value='<c:out value="${ board.pageNum }" />' /> <input
								type='hidden' name='amount'
								value='<c:out value="${ board.amount }" />' />
							<button class='btn_blue' onclick="search();">Search</button>

							<div>
								<button id="writeForm" class="btn btn-outline-info btn_free_cus"
									onclick="location.href='../qnaboard/register'">작성하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="board_list">
				<!-- 게시물 목록 테이블(표) -->
				<table class="list_tbl" style="width: 100%; text-align: center;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">유형</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">답변여부</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td class="align-middle align-middle"><c:out
									value="${board.bno}" /></td>
							<td class="align-middle align-middle"><c:out
									value="${board.cate_kind}" /></td>
							<td class="align-middle align-middle">

									<%-- 				<c:when test="${board.secret_type == '1'}">
										<i class="bi bi-lock">비밀글 입니다.</i>
									</c:when>
									<c:otherwise>
										<a href="/qnaboard/read?bno=${board.bno }"> <c:out
												value="${board.title}" />
										</a>
									</c:otherwise></c:choose> --%>

									<c:if test="${board.secret_type == '1'}">
										<i class="bi bi-lock">비밀글 입니다.</i>
									</c:if>
									<a href="/qnaboard/read?bno=${board.bno }"> <c:out
											value="${board.title}" />
									</a></td>
							<td class="align-middle align-middle"><c:out
									value="${board.id}" /></td>
							<td class="align-middle align-middle"><fmt:formatDate
									value="${board.reg_date}" pattern="yyyy-MM-dd" /></td>
							<td class="align-middle align-middle"><c:if
									test="${board.ans_type == 'Y'}">
                           답변완료
                        </c:if> <c:if test="${board.ans_type == 'N'}">
                           미답변
                        </c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<!-- 페이징 처리 -->
			<div class='pull-right'>
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${ pageMaker.startPage-1 }">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button ${ pageMaker.cri.pageNum == num ? "active":"" } "><a
							href="${ num }">${num}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${ pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>

			<script type="text/javascript">
/* 게시물의 작성하기 클릭했을때 작성하기 폼으로 이동하는 이벤트 처리 */
   $("#writeForm").on("click",function(e) {
         e.preventDefault();
         actionForm
               .append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
         actionForm.attr("action","../qnaboard/registerProc");
         actionForm.submit();
   });
   
   
   //페이징처리
   var listForm = $("#listForm");
   $(".paginate_button a").on("click",function(e) {
      e.preventDefault();
      //console.log("click");
      //listForm.find("input[name='pageNum']").val($(this).attr("href"));
      $("input[name='pageNum']").val($(this).attr("href"));
      listForm.submit();
   });
   
   /* 게시물의 제목을 클릭했을 떄 이동하도록 이벤트 처리 */
   $("#move").on("click",function(e) {
         e.preventDefault();
         actionForm
               .append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
         actionForm.attr("action","/qnaboard/read?bno=" + $("#bno").val());
         actionForm.submit();
   });
   
   //게시글 검색
   function search(){
      
       var name;
       
       $( '#listForm' ).find('select, input').each(function(){

          if( !$(this).prop('required')){   //required 속성이 없을때

           } else {   //required 속성이 있을때
               if ($(this).val() == "" ) {
                  //alert($( this ).attr( 'name' ) +"val"+ $(this).val());
                  var msg = $(this).data("msg");
                   alert(msg);
                   //name = $( this ).attr( 'name' );
                   //fail_log += name + " is required \n";
                   
                   return false;
               }

           }
       });
       //검색할때..1부터 다시 검색해야 제대로 나오니까..1로 하는거야
       //검색할땐 당연히 검색조건이 변경되거나 그대로 일수있으니까 1로 주는거..1~10까지 이렇게
       $("input[name='pageNum']").val(1);
       
      //$("#listForm").attr("action","/board/list").submit();
   }
</script>

			<%@include file="../include/footer.jsp"%>