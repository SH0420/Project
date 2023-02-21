
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="./include/header.jsp"%>
<link rel="stylesheet" href="../../resources/css/styles.css">
<link rel="stylesheet" href="../../resources/css/full.css">
<div class="video-box">
	<video class="video-container" autoplay muted loop>
		<source src="../resources/images/people.mp4" type="video/mp4"><source>
</div>

<script>

function random(n) {
    return (Math.floor(Math.random()*10)%6);
}
</script>


<section class="features-icons bg-light text-center">
	<div class="container">
		<div class="row">
			<hr>
			<h2 id="best" class="blinking1 col text-start">BEST PROGRAM</h2>
			<h2 id="new" class="blinking2 col text-end">NEW PROGRAM</h2>
			<hr>
		</div>
		<div class="row">
			<div id="bestview"
				class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-1">
				
				<c:forEach items="${list1}" var="list">
					<div class="col">
						<div class="card shadow-sm">
								<script language="JavaScript">
									var ch = ${list.cate_num};
									
									if(ch == 01 ){
										console.log("카테고리 01 레저  : " + ch);
									    document.write( '<img src="../resources/images/레저1'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else if(ch == 02){
										console.log("카테고리 02 운동  : " + ch);
									    document.write( '<img src="../resources/images/운동2'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else if(ch == 03){
										console.log("카테고리 03 맛집 : " + ch);
									    document.write( '<img src="../resources/images/맛집3'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else{
										console.log("카테고리 04 스터디 : " + ch);
									    document.write( '<img src="../resources/images/스터디1'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}
							    </script>
							<div class="card-body">
								<p class="card-text"><i>${list.rnum}위</i>&nbsp&nbsp&nbsp<b>${list.club_name}</b> </p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary ani-button" 
										 onclick="location.href='/club/detail?cno=${list.cno}'">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="newview"
				class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-1">
				
				
					<c:forEach items="${list2}" var="list">
					<div class="col">
						<div class="card shadow-sm">
						 <!-- 사진만 카테고리별로 변경  -->
							<!-- <img class="bd-placeholder-img card-img-top" width="100%"
								height="225" src="../resources//images/climb.jpg" role="img"
								focusable="false"> -->
								<script language="JavaScript">
									var ch = ${list.cate_num};
									
									if(ch == 01 ){
										console.log("카테고리 01 레저  : " + ch);
									    document.write( '<img src="../resources/images/레저1'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else if(ch == 02){
										console.log("카테고리 02 운동  : " + ch);
									    document.write( '<img src="../resources/images/운동2'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else if(ch == 03){
										console.log("카테고리 03 맛집 : " + ch);
									    document.write( '<img src="../resources/images/맛집3'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}else{
										console.log("카테고리 04 스터디 : " + ch);
									    document.write( '<img src="../resources/images/스터디1'
									    		 +'.jpg" width="100%" height="225px" border="0">');
									}
							    </script>
							<div class="card-body">
								<p class="card-text"><i>${list.rnum}위</i> &nbsp&nbsp&nbsp  <b>${list.club_name}</b> </p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary ani-button" 
										 onclick="location.href='/club/detail?cno=${list.cno}'">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			
			</div>
		</div>
	</div>
</section>

<!-- Image Showcases-->
<section class="showcase">
	<div class="container-fluid p-0" style="background-color: aliceblue;">

		<div class="row g-0 " style="position: relative;">
			<!-- <div class="white-box"></div> -->
			<div
				class="col-lg-6 order-lg-2 text-white showcase-img scale-up-hor-left ani-img"
				style="background-image: url('../resources/images/mainsoccer.jpg'); background-size: cover; background-position: center;"></div>
			<div class="col-lg-6 order-lg-1 my-auto showcase-text">
				<h2>Sports-Futsal</h2>
				<p class="lead mb-0">Partner in every way<br> 이 세상은 훌륭하게 구성되어 있어,언제 어디에 있더라도 누구나 다른 모든 것들과 조화를 이루고 있다.</p>
			</div>
		</div>
		<div class="row g-0" style="position: relative;">
			<div class="white-box"></div>
			<div class="col-lg-6 text-white showcase-img ani-img"
				style="background-image: url('../resources/images/waterski.jpg'); background-size: cover; background-position: center;"></div>
			<div class="col-lg-6 my-auto showcase-text">
				<h2>Activity-water-skiing</h2>
				<p class="lead mb-0">Innovation for a Better Life<br>대부분의 사람들은 자신이 행복하고자 마음먹은 만큼 행복해지다.</p>
			</div>
		</div>
		<div class="row g-0" style="position: relative;">
			<div class="white-box"></div>
			<div class="col-lg-6 order-lg-2 text-white showcase-img ani-img"
				style="background-image: url('../resources/images/cafe.jfif');background-position: center;"></div>
			<div class="col-lg-6 order-lg-1 my-auto showcase-text">
				<h2>Trip-visiting Food Trip</h2>
				<p class="lead mb-0">어제보다 더 나은 오늘,오늘보다 더 큰 내일로- <br>항해에 나서라!시도하라! 그 외에는 아무것도 없다</p>
			</div>
		</div>
		<div class="row g-0" style="position: relative;">
			<div class="white-box"></div>
			<div class="col-lg-6 text-white showcase-img ani-img"
				style="background-image: url('../resources/images/travel1.jpg');background-position: center;"></div>
			<div class="col-lg-6 my-auto showcase-text">
				<h2>Travel</h2>
				<p class="lead mb-0">미래사회에 대한 영감, 새로운 미래 창조!<br>마음을 담장 너머로 던져 넘기면 나머지는 저절로 따라 넘어가게 된다.</p>
			</div>
		</div>

	</div>
</section>
<script>
	$(document).ready(function(){
		   
		   $("#bestview").show();
		   $("#newview").hide();
	
		   $("#best").on("click" , function(){
		      $("#bestview").show();
		      $("#newview").hide();
		      console.log("click!");
		   });
		   
		   $("#new").on("click" , function(){
		      $("#newview").show();
		      $("#bestview").hide();
		      console.log("click!");
		   });
		});
	
		$(function(){
			$(document).one('click', '.like-review', function(e) {
				$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
				$(this).children('.fa-heart').addClass('animate-like');
			});
		});
</script>


<%@include file="./include/footer.jsp"%>