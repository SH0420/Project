<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<!-- <link rel="stylesheet" href="../resources/css/Main.css">
<link rel="stylesheet" href="../resources/css/boardcss.css"> -->

<!-- <link rel="stylesheet" href="../resources/css/bootstrap.min_1.css"> -->
<link rel="stylesheet" href="../resources/css/swiper.css">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/respon.css">
<link rel="stylesheet" href="../resources/css/full.css">

<div class="container" style="padding-top: 150px;">
	<img src="../resources/images/hyerim.jpg" width="100%" height="300px">
</div>

<div class="content respon2">
	<form id="listForm" action="/board/list" method="post">
		<!-- <div class="table-group"> -->
		<section class="list_box">
			<!-- <div class="container text-center"> -->
			<div class="board_list" style="margin-top: 20px;">
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
									onclick="location.href='../board/register'">작성하기</button>
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
							<th scope="col">첨부파일</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td class="align-middle align-middle"><c:out
									value="${board.bno}" /></td>
							<td class="align-middle align-middle"><c:out
									value="${board.cate_kind}" /></td>
							<td><a href="/board/read?bno=${board.bno}"
								class="text-secondary text-center"> <i class="icofont-lock"></i>
									<c:out value="${board.title}" /> <span class="text-muted small">
										[${board.replyCnt}]</span>
							</a></td>
							<td class="align-middle align-middle"><c:out
									value="${board.id}" /></td>
							<td class="align-middle align-middle"><fmt:formatDate
									value="${board.reg_date}" pattern="yyyy-MM-dd" /></td>
							<td class="text-center">
								<div class="btn-group align-top">
									<c:if test="${board.file_check == 'Y'}">
										<img alt="첨부파일이미지" src="../resources/images/file_icon.png">
									</c:if>
									<!-- </form> -->
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</form>
</div>

<!-- 페이징 처리 -->
<!-- <div class='pull-right'> -->
<div id="pagenation">
	<c:if test="${pageMaker.prev}">
		<a href="${ pageMaker.startPage-1 }" class="paginate_button"> <i
			class="fa fa-angle-double-left" aria-hidden="true"></i>
		</a>
	</c:if>

	<c:forEach var="num" begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}">
		<c:if test="${ pageMaker.cri.pageNum == num}">
			<strong>${num}</strong>
		</c:if>
		<c:if test="${ pageMaker.cri.pageNum != num}">
			<a href=" ${num}" class="paginate_button">${num}</a>
		</c:if>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="${ pageMaker.endPage + 1 }" class="paginate_button"> <i
			class="fa fa-angle-double-right" aria-hidden="true"></i>
		</a>
	</c:if>
</div>

<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Save
					changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!-- 사이드바 맨위 맨아래 -->
<!--    <a style="display:scroll;position:fixed;bottom:80px; right:30px;" rel="nofollow"
   href="#" style="font-size:2.0em">▲</a>
   <a style="display:scroll;position:fixed;bottom:40px; right:30px;" rel="nofollow"
   href="#scrollbottom" style="font-size:2.0em">▼</a>
   <div id="scrollbottom"></div> -->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function() {

/*       var result = '<c:out value="${result}"/>';
   
      checkModal(result);
   
      history.replaceState({}, null, null);
   
      function checkModal(result) {
         if (result === '' || history.state) {
            return;
         }
   
         if (parseInt(result) > 0) {
            $(".modal-body").html(
                  "게시글 " + parseInt(result)
                        + "번이 등록되었습니다.");
         }
         $("#myModal").modal("show");  //모달 창 출력 
      } */
   
      /* $("#regBtn").on("click", function() {
         self.location = "/board/register";
      }); */

   //페이징처리
   var listForm = $("#listForm");
   $(".paginate_button").on("click",function(e) {
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
         actionForm.attr("action","/board/read?bno=" + $("#bno").val());
         actionForm.submit();
   });
   
   /* 게시물의 작성하기 클릭했을때 작성하기 폼으로 이동하는 이벤트 처리 */
   $("#writeForm").on("click",function(e) {
         e.preventDefault();
         actionForm
               .append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
         actionForm.attr("action","../board/register");
         actionForm.submit();
   });
   
   
   /* $("#cate_num").change(function(){
      $("#listForm").submit();
          }); */
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

      /* ajax선언 */
      /* $.ajax({
         url: '/list',
         processData: false,
         contentType: false,
         data: formData,
         type: 'POST',
         dataType: 'json',
         success: function (result) {
            console.log(result);
         } 
      });*/
</script>

<%@include file="../include/footer.jsp"%>