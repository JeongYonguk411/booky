<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	<div class="sub_title">
		<h2 class="top_title"><span class="xi-library"></span>공지사항</h2>
		<div class="container">
		  <div class="location">
		  </div>
		</div><!-- container end -->
	</div>

	<div id="notice_wrapper" class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">공지사항 수정</h2>
	  <form name="notice" method="post" action="/notice/modify" onsubmit="return check()">
	  <input type="hidden" name="bno" value=${notice.bno }>
	  <input type="hidden" name="pageNum" value="${cri.pageNum}">
	  <input type="hidden" name="amount" value="${cri.amount}">
	  <input type="hidden" name="type" value="${cri.type}">
	  <input type="hidden" name="keyword" value="${cri.keyword}">
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="first">
						<th>글쓴이</th>
						<td><input type="text" name="writer" value=${notice.writer }></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value=${notice.title }></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" >${notice.content }</textarea></td>
					</tr>
					<tr>
						<th>첨부</th>
						<td><input type="file" name="photo"></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='/notice/list';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			if(notice.writer.value=="") {
				alert("글쓴이 입력");
				notice.writer.focus();
				return false;
			}
			if(notice.title.value=="") {
				alert("제목을 입력");
				notice.title.focus();
				return false;
			}
			if(notice.contents.value=="") {
				alert("내용을 입력");
				notice.contents.focus();
				return false;
			}
			return true;
		}
	</script>
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
		});
	</script>
	<%@ include file="../footer.jsp" %>