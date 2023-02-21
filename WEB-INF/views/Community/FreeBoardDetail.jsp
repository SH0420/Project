 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/full.css">
   
  <div class="container" style="margin-top: 100px;">
       <img src="../resources/images/hyerim.jpg" width="100%" height="400px">
   </div>
   
   <div class="container">
      <div class="row">
      <form role="form" id="read" name="read" method="POST" autocomplete="off">
         <input type="hidden" name="bno" value="${board.bno}">
         <input type="hidden" name="replayPage" value="1">
         
         <table class="table table-stripped"  border :1px solid #dddddd" > <%-- 홀,짝 행 구분 --%>
            <tbody>
               <tr>
                  <td>게시글 번호 : ${board.bno}</td> 
                  <%-- <input class="form-control" name="bno" value='<c:out value="${ board.bno }" />' readonly="readonly" /> --%>
               </tr>
               <tr>
                  <td>카테고리 : 
                      <select id="cate_num" name="cate_num">
                        <option>--카테고리 선택--</option> 
                        <c:forEach items="${cateList}" var="category">
                           <option value="${category.cate_num}"<c:if test="${category.cate_num == board.cate_num}">selected="selected"</c:if>>${category.cate_kind}</option>
                        </c:forEach>
                     </select> 
                  </td>  
               </tr>
               <tr>
                  <td>제목: 
                     <textarea type="text" class="form-control" name="title">${board.title}</textarea>
                  </td>  
               </tr>
                  <td>작성자 :  ${board.id} | 작성일 :  ${board.reg_date} 
                     <c:if test="${!empty board.mod_date}">
                        | 수정일  : ${board.mod_date}
                     </c:if>
                  </td>
               <tr>
                  <td>내용  : 
                  <textarea type="text" class="form-control" name="content" maxlength="4000px" style="height:350px;">${board.content}</textarea>
                  </td>
               </tr>
               <tr>
                  <c:forEach items="${file}" var="file">
                        <td>
                     <img alt="첨부파일이미지" src="../resources/images/file_icon.png">
                     첨부파일 : 
                           <a href="javascript:fileDownload();">${file.realFileName}</a>
                           <c:if test="${board.id == lvo.id }"> 
                              <button type="button" class='btn_blue' onclick="deleteFile();">삭제</button>
                           </c:if>
                           <input type="hidden" name="fileName" value="${file.fileName}">
                           <input type="hidden" name="uuid" value="${file.uuid}">
                        </td>
                        </c:forEach>
               </tr>
            </tbody>
         </table>
         
         <!-- 댓글 모달 코드 추가 -->
         <div class='row'>
            <div class="col-lg-12">
               <div class="panel panel-default">
                  <div class="panel-heading">
                     <i class="fa fa-comments fa-fw"></i> Reply
                     <div class="input-group mb-7" >
                          <input type="text" id="replyReg" class="form-control" placeholder="댓글을 입력해주세요!" aria-describedby="button-addon2">
                          <button id='regBtn' type="button" class="btn btn-primary">등록하기</button>
                     </div>
                  </div>
                  
                  <div class="panel-body">
                     <ul class="chat">
                         <li class="left clearfix" data-rno='12'>
                           <div>
                              
                           </div>
                        </li> 
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         
         <!-- 새 댓글 추가 모달창 -->
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Reply</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>댓글</label>
               <input class="form-control"   name='reply' value='${reply.reply }'>
            </div>
            <div class="form-group">
               <label>아이디</label>
               <input class="form-control"   name='replyer' value='${board.id}' readonly>
            </div>
            <div class="form-group">
               <label>댓글 등록일</label>
               <input class="form-control"   name='replyDate' value='${board.reg_date}'>
            </div>
         </div>
         <div class="modal-footer">
             <button id='modalModBtn' type="button" class="btn btn-primary">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-primary">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type='button' class='btn btn-default'>Close</button>
          </div>
               </div>
            </div>
         </div>
         
      
         <div class="btn-group" role="group" aria-label="Basic example" style="text-align:end; margin:20px;">
            <!-- 로그인 유저랑 일치하는지 확인된 본인만 수정/삭제가 가능 -->
             <c:if test="${board.id == lvo.id }"> 
               <button type="button" class="btn btn-primary" onclick="clickMod()">수정</button>
               <button type="button" class="btn btn-primary" onclick="clickDel()">삭제</button>
             </c:if>   
             <button type="reset" class="btn btn-primary" onclick="location.href='/board/list'">목록보기</button>
             <!-- Button trigger modal -->
                  
         <!-- Delete-Modal -->
         <%-- <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               
               <div class="modal-body">
                <p>게시물을 정말 삭제하시겠습니까?</p>
               </div>
               
               <div class="modal-footer">
                  <input type="hidden" name="bno" value="${board.bno }"/>
                  <button type="submit" class="btn btn-primary">확인</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='/board/list'">취소</button>
               </div>
               
             </div>
           </div>
         </div> --%>
         
         <!-- Modify-Modal -->
         <%-- <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">게시물 수정</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>--%>
      </div><!--end btn-group -->
      

         
      </form>
      </div>
   </div>      
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

   /* //폼을 변수에 저장
   var formObj = $("form[role='form']");
    
   // delete 버튼 클릭
    $("#delete_btn").click(function(){
       
       formObj.attr("action", "/board/delete?bno=" + $("#bno").val());
         formObj.attr("method", "get");    
         formObj.submit();   
    });
   
    $("#modify_btn").click(function(){
          
       formObj.attr("action", "/board/modify?bno=" + $("#bno").val());
         formObj.attr("method", "get");    
         formObj.submit();   
    });
 */
 
    function clickDel() {
      document.read.action = "/board/delete";
      document.read.submit();
   }
 
   function clickMod() {
      document.read.action = "/board/update";
      document.read.submit();
   }
   
   function deleteFile(){
      var bno = $("input[name=bno]").val();
      $.ajax({
         url: "/board/deleteFile",
         data: {"bno": bno},
         type: 'get',
         dataType: 'json',
         success: function (result) {
            alert(result);
            console.log(result);
         }
      });
   }
   
   /* 게시물의 작성하기 클릭했을때 작성하기 폼으로 이동하는 이벤트 처리 */
   $("#replyForm").on("click",function(e) {
         e.preventDefault();
         actionForm
               .append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
         actionForm.attr("action","../board/register");
         actionForm.submit();
   });

   /* 댓글 전체 목록 보여주기 + 모달창 */
   $(function(){   
      var bnoValue = '<c:out value="${board.bno}"/>';
        var replyUL = $(".chat");
  
       showList(1);
       
       //댓글 리스트에 댓글 보여주는 기능
       var modal = $(".modal");
          var modalInputReply = modal.find("input[name='reply']");
          var modalInputReplyer = modal.find("input[name='replyer']");
          var modalInputReplyDate = modal.find("input[name='replyDate']");
          
          var modalModBtn = $("#modalModBtn");
          var modalRemoveBtn = $("#modalRemoveBtn");
          var modalRegisterBtn = $("#modalRegisterBtn");
          
          // 모달창 Close 눌러서 닫아 지게 하는 기능
         $("#modalCloseBtn").on("click", function(e){
           
           modal.modal('hide');
       });
       
          // 처음 새 댓글을 등록할 때, 날짜, 수정, 삭제 기능은 가려지게 하는 기능
       $("#addReplyBtn").on("click", function(e){
             
            modal.find("input").val("");
             modalInputReplyDate.closest("div").hide();
             modal.find("button[id !='modalCloseBtn']").hide();
             
             modalRegisterBtn.show();
             
             $(".modal").modal("show");
             
       });
          
          // 댓글 조회 클릭 이벤트 처리
          // chat의 하위태그인 li에 클릭 이벤트를 준다.
          $(".chat").on("click", "li", function(e){
             // this-> 현재 이벤트를 발생시키는 대상 즉 li임. data 속성에 담긴 rno(댓글번호) 를 변수에 담는다.
             var rno = $(this).data("rno");
             replyService.get(rno, function(reply){
                // input 태그의 name이 'reply' 의 값 
                modalInputReply.val(reply.reply);
             
                // 읽어온 글번호를 data에 다시 담아준다. (나중에 수정이나 삭제를 해야하기 때문에)
                modal.data("rno", reply.rno);
                
                // 모달의 button 중, id가 modalCloseBtn이 아닌 것들은 모두 숨긴다.
                modal.find("button[id !='modalCloseBtn']").hide();
                // 모달의 modify 버튼 보여주기
                modalModBtn.show();
                // 모달의 remove 버튼 보여주기
                modalRemoveBtn.show();
                
                $(".modal").modal("show");
             });
          });
          
          // 댓글의 수정 이벤트 처리 (JSON 형식)
          modalModBtn.on("click", function(e){
             // rno : modal.data("rno")-> 위의 댓글 조회에서 받아온 data속성의 값을 rno의 값으로 지정한다.
             var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
             replyService.update(reply, function(result){
                alert(result);
                modal.modal("hide");
                showList(1);
             });
          });
          
          // 댓글의 삭제 이벤트 처리
          modalRemoveBtn.on("click", function(e){
             var rno = modal.data("rno");
             replyService.remove(rno, function(result){
                alert(result);
                modal.modal("hide");
                showList(1);
             });
          });
          
          
   });
   
   function showList(page){
      var bnoValue = '<c:out value="${board.bno}"/>';
      var replyUL = $(".chat");
      replyService.getList({bno:bnoValue,page: page || 1 }, function(list) {
          var str="";
 
           if(list == null || list.length == 0){
             return;
           }
           
           for (var i = 0, len = list.length || 0; i < len; i++) {
              str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
               str +="  <div><div class='header'><strong class='primary-font'>["
                +list[i].rno+"] "+list[i].id+"</strong>"; 
               str +="    <small class='pull-right text-muted'>"
                 +list[i].reg_date+"</small></div>";
               str +="    <p>"+list[i].reply+"</p></div></li>";
           }
 
          replyUL.html(str);
           
      });  //end function
   } //end showList 
   
   //상세보기에 파일 다운로드 할수있는 기능
   function fileDownload(fileName){
         document.read.method="get";
         document.read.action = "/board/download";
         document.read.submit();
      }
   
   //새 댓글 등록하기 기능
   $('#regBtn').click(function() {
      var reply = {
            reply: $("#replyReg").val(),
            bno : $("input[name=bno]").val(),
            id : "<c:out value='${lvo.id}'/>"
      }
   
      
      $.ajax({
         url: '/replies/new',
         data : JSON.stringify(reply),
         type: 'POST',
         contentType : "application/json; charset=utf-8",
         success: function (result) {
            
           }
       });
      
      $("#read").attr("method","get");
      $("#read").attr("action","/board/read?bno="+$("input[name=bno]").val());
      $("#read").submit();
      //showList(1); //댓글 재조회
   });
   
   //$(document).ready()를 이용해서 첨부파일을 보여주는 작업을 처리한다.
   $(document).ready(function(){
      (function(){
         var bno = '<c:out value="${board.bno}"/>';
         
         $.getJSON("/board/getAttachList", {bno:bno}, function(arr){
            
            //console.log(arr);
            
            var str = "";
            $(arr).each(function(i, attach){
               
               //image type
               /*if(attach.fileType){
                     
                     var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
                      
                      str += "<li data-path='"+attach.uploadPath+"'"; 
                      str +=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
                      str += "<span> "+ attach.fileName+"</span>";
                      str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
                      str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                      str += "<img src='/display?fileName="+fileCallPath+"'>";
                      str += "</div>";
                      str +"</li>";
                     
                      }else{
                         
                      str += "<li data-path='"+attach.uploadPath+"'"; 
                     str +=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
                      str += "<span> "+ attach.fileName+"</span><br/>";  
                      str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                      str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                      str += "<img src='/resources/img/attach.png'>";
                      str += "</div>";
                      str +"</li>";
                    }  */   
            });
            
            $(".uploadResult ul").html(str);
            
         });//end getJSON
         
      })();//end function
      
      // X버튼 삭제이벤트 처리
      $(".uploadResult").on("click", "button",function(e){
         
         console.log("delete file");
         
         if(confirm("Remove this file?")){
            
            var targetLi = $(this).closest("li");
            targetLi.remove();
         }
      });
   });
   
</script>
   
<%@include file="../include/footer.jsp"%>