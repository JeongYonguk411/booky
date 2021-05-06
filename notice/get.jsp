<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/resources/css/notice.css">

<div class="booky_point booky_point_top">
	<div class="booky_point_box booky_point_box_3">
		<div class='wave -one'></div>
		<div class='wave -two'></div>
		<div class='wave -three'></div>
		<div class="point_t">BOOKY BOOKY</div>
	</div>
</div>

<!-- sub contents -->
	
	<div id="notice_wrapper" class="container">
		<div class="board_view">
			<h2><${notice.title}></h2>
			<p class="info"><span class="user">${notice.writer }</span> | <fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd"/> | <i class="fa fa-eye"></i> ${notice.viewcount}</p>
			<div class="board_body">
				${notice.content }
			</div>
			<div class="prev_next">
			<c:if test="${prevTitle.bno != null }">
				<a href="${prevTitle.bno}" class="btn_prev np"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>"${prevTitle.title}"</span>
				</span>
				</c:if>
				</a>
				<div class="btn_3wrap">
					<a href="/notice/list?pageNum=${cri.pageNum}&amount=${cri.amount}&bno=${notice.bno}&keyword=${cri.keyword}&type=${cri.type}">목록</a> 
					<a href="/notice/modify?pageNum=${cri.pageNum}&amount=${cri.amount}&bno=${notice.bno}&keyword=${cri.keyword}&type=${cri.type}">수정</a> 
					<a href="/notice/remove?pageNum=${cri.pageNum}&amount=${cri.amount}&bno=${notice.bno}&keyword=${cri.keyword}&type=${cri.type}">삭제</a>
				</div>
				<c:if test="${nextTitle.bno != null }">
				<a href="${nextTitle.bno}" class="btn_next np">
				<span class="next_wrap">
					<strong>다음글</strong><span>"${nextTitle.title}"</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
				</c:if>
			</div>
		</div>
	</div>

<form id="actionForm" action="/notice/list">
      <input type="hidden" name="pageNum" value="${pageNum}">
      <input type="hidden" name="amount" value="${amount}">
      <input type="hidden" name="type" value="${type}">
      <input type="hidden" name="keyword" value="${keyword}">
   </form>

	<!-- end contents -->
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
			 var actionForm = $('#actionForm');
			$('.np').on('click', function(e) {
	            e.preventDefault();
	            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
	            actionForm.attr("action", "/notice/get");
	            actionForm.submit();
	         });
		}); //다음페이지
	</script>

<%@ include file="../footer.jsp"%>