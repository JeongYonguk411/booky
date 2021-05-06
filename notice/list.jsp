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
<div class="sub_title">
	<h2 class="top_title"><span class="xi-library"></span>공지사항</h2>
	<div class="container">
		<div class="location"></div>
	</div>
	<!-- container end -->
</div>

<div id="notice_wrapper" class="container">
	<div class="search_wrap">
		<div class="record_group">
			<p>
				총게시글<span>${pageMaker.total}</span>건
			</p>
		</div>
		<div class="search_group">
			<form id="searchForm" name="myform" method="get"
				action="/notice/list">
				<select name="type" class="select">
					<option value="" <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>선택</option>
					<option value="T" <c:out value="${pageMaker.cri.type eq'T'?'selected':'' }"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>

				</select> <input type="text" name="keyword" class="search_word"
					value="<c:out value='${pageMaker.cri.keyword}'/>"> <input
					type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<button class="btn_search" type="submit">
					<i class="fa fa-search"></i><span class="sr-only">검색버튼</span>
				</button>
			</form>
		</div>
	</div>
	<!-- search end -->
	<div class="bord_list">
		<table class="bord_table" summary="이표는 번호,제목,글쓴이,날자,조회수로 구성되어 있습니다">
			<caption class="sr-only">공지사항 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="num" value="${pageMaker.total - (pageMaker.cri.pageNum > 1 ? (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount : 0) }" />
				<c:forEach items="${list}" var="notice">
					<tr>
						<td>${num}</td>
						<td class="title"><a class="move" href="<c:out value='${notice.bno}'/>">${notice.title}</a></td>
						<td>${notice.writer}</td>
						<td><fmt:formatDate pattern="yy-MM-dd" value="${notice.regdate}" /></td>
						<td>${notice.viewcount}</td>
					</tr>
					<c:set var="num" value="${num-1}"></c:set>
				</c:forEach>
			</tbody>
		</table>

		<div class="paging">
			<c:if test="${login != null}">
			<a href="/notice/register" class="btn_write">글쓰기</a>
			</c:if>
			
		</div>
	</div>
</div>
<!-- end contents -->
<script src="/resources/js/mypage/paging.js"></script>
<form id="actionForm" action="/notice/list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
</form>

<script>
	$(function() {
		page();
		$(".pageing").addClass("sub_list");
		var result = '<c:out value="${result}" />';
		checkModal(result);
		history.replaceState("", null, null);
		function checkModal(result) {
			if(result == '')return;
			
			if(parseInt(result) > 0){
				popup_show('게시글 ' + parseInt(result) + '번 등록 완료', '확인');
			}
		}

		var actionForm = $('#actionForm');

		$('.paging a').on('click', function(e) {
			if($(this).attr('href')=='/notice/register')return;
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		});

		$('.move').on(
				'click',
				function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
					actionForm.attr("action", "/notice/get");
					actionForm.submit();
				});

		$('.btn_write').on('click', function(e) {
			e.preventDefault();
			self.location = "/notice/register";
		});

		var searchForm = $("#searchForm");
		$("#searchForm .btn_search").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				popup_show('검색내용를 선택하세요', '확인');
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				popup_show('키워드를 입력하세요', '확인');
				return false;
			}
			if (!searchForm.find("input[name='pageNum']").val('1'))
				;
			e.preventDefault;

			searchForm.submit();

		})

	}); //end
</script>

<%@ include file="../footer.jsp"%>