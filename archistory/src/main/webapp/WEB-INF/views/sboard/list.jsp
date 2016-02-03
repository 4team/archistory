<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<style>
/* These apply across all breakpoints because they are outside of a media query */
/* Make the labels light gray all caps across the board */
.movie-list thead th,
.movie-list tbody th .ui-table-cell-label,
.movie-list tbody td .ui-table-cell-label {
    text-transform: uppercase;
    font-size: .7em;
    color: rgba(0,0,0,0.5);
    font-weight: normal;
}
/* White bg, large blue text for rank and title */
.movie-list tbody th {
    font-size: 1.2em;
    background-color: #fff;
    color: #77bbff;
    text-align: center;
}
/*  Add a bit of extra left padding for the title */
.movie-list tbody td.title {
    padding-left: .8em;
}
/* Add strokes */
.movie-list thead th {
    border-bottom: 1px solid #d6d6d6; /* non-RGBA fallback */
    border-bottom: 1px solid rgba(0,0,0,.1);
}
.movie-list tbody th,
.movie-list tbody td {
    border-bottom: 1px solid #e6e6e6; /* non-RGBA fallback  */
    border-bottom: 1px solid rgba(0,0,0,.05);
}
/*  Custom stacked styles for mobile sizes */
/*  Use a max-width media query so we don't have to undo these styles */
@media (max-width: 40em) {
    /*  Negate the margin between sections */
    .movie-list tbody th {
        margin-top: 0;
        text-align: left;
    }
    /*  White bg, large blue text for rank and title */
    .movie-list tbody th,
    .movie-list tbody td.title {
        display: block;
        font-size: 1.2em;
        line-height: 110%;
        padding: .5em .5em;
        background-color: #fff;
        color: #77bbff;
        -moz-box-shadow: 0 1px 6px rgba(0,0,0,.1);
        -webkit-box-shadow: 0 1px 6px rgba(0,0,0,.1);
        box-shadow: 0 1px 6px rgba(0,0,0,.1);
    }
    /*  Hide labels for rank and title */
    .movie-list tbody th .ui-table-cell-label,
    .movie-list tbody td.title .ui-table-cell-label {
        display: none;
    }
    /*  Position the title next to the rank, pad to the left */
    .movie-list tbody td.title {
        margin-top: -2.1em;
        padding-left: 2.2em;
        border-bottom: 1px solid rgba(0,0,0,.15);
    }
    /*  Make the data bold */
    .movie-list th,
    .movie-list td {
        font-weight: bold;
    }
    /* Make the label elements a percentage width */
    .movie-list td .ui-table-cell-label,
    .movie-list th .ui-table-cell-label {
        min-width: 20%;
    }
}
/* Media query to show as a standard table at wider widths */
@media ( min-width: 40em ) {
    /* Show the table header rows */
    .movie-list td,
    .movie-list th,
    .movie-list tbody th,
    .movie-list tbody td,
    .movie-list thead td,
    .movie-list thead th {
        display: table-cell;
        margin: 0;
    }
    /* Hide the labels in each cell */
    .movie-list td .ui-table-cell-label,
    .movie-list th .ui-table-cell-label {
        display: none;
    }
}
/* Hack to make IE9 and WP7.5 treat cells like block level elements */
/* Applied in a max-width media query up to the table layout breakpoint so we don't need to negate this */
@media ( max-width: 40em ) {
    .movie-list td,
    .movie-list th {
        width: 100%;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: left;
        clear: left;
    }
}
</style>



<style type= "text/css">
.box{
position : fix;
margin-left :200px;
margin-right:200px;
}

.col-md-12{
top:50px;
}
</style>

<div class="center-container">
    <div class="center-row">
    
    
    <!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
		
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">SEARCH</h3>
				</div>

				<h1>${cri.searchType}</h1>
				<div class='box-body'>

					<select name="searchType" id="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
							<button id='searchBtn'>Search</button>						
			</div>
		</div>
		
				<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
				
<table data-role="table" id="movie-table-custom" data-mode="reflow" class="movie-list">
  <thead>
    <tr>
      <th data-priority="1">BoardNO</th>
      <th style="width:40%">TITLE</th>
      <th data-priority="4">WRITER</th>
      <th data-priority="2">REGDATE</th>
      <th data-priority="4">VIEWCNT</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${list}" var="list">
    <tr>
      <th>${list.boardNo}</th>
      <td class="title"><a href='/sboard/read${pageMaker.makeSearch(pageMaker.cri.page) }&boardNo=${list.boardNo}'>${list.title}
    <strong> [${list.replycnt}]</strong></a></td>
      <td>${list.writer}</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.regdate}" /></td>
	<td><span class="badge bg-red">${list.vcount}</span></td>
    </tr>
    </c:forEach>
    
  </tbody>
</table>
    
    <div class="text-center">
						<ul class="pagination">
						<c:if test="${pageMaker.prev}">
						<li><a href='javascript:goPage(${pageMaker.startPage-1});'><<</a>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class='${pageMaker.cri.page==idx?"active":""}'><a href='javascript:goPage(${idx});'>${idx}</a></li>
							</c:forEach>
						
						<c:if test="${pageMaker.next}">
						<li><a href='javascript:goPage(${pageMaker.endPage+1});'>>></a>
						</c:if>
						</ul>
						
					</div>
			
<div class="box-footer" style="float: right">
	<button type="submit" class="btn btn-write">WRITE</button>	
</div>


<form id="jobForm" method="get">
  <input type='hidden' name="boardNo" value=''>
  <input type='hidden' name="page" value='${pageMaker.cri.page}'>
  <input type='hidden' name="perPageNum" value='${pageMaker.cri.perPageNum}'>
  <input type='hidden' name="searchType" value='${cri.searchType}'>
  <input type='hidden' name="keyword" value='${cri.keyword}'>
</form>


<script>
var result='${msg}';
if(result=='SUCCESS'){
	alert("처리가 완료되었습니다.")
}

$(document).ready(function() {

	$(".btn-write").on("click", function() {
		self.location = "/sboard/register";
	});
});

function viewPage(boardNo){
	var jobForm=$("#jobForm");
	
	jobForm.attr("action","/sboard/read");
	jobForm.find("[name='boardNo']").val(boardNo);
	jobForm.submit();
}

function goPage(num){
	console.log(num);
	var jobForm=$("#jobForm");
	
	jobForm.attr("action","/sboard/list");
	jobForm.find("[name='page']").val(num);
	jobForm.submit();	
}


$("#searchBtn").on("click",function(event){
	event.preventDefault();
	var jobForm=$("#jobForm");
	var sType = $("#searchType option:selected").val();
	var keyword = $("[name='keyword']").val();
	console.log(sType+" : " + keyword);
	
	jobForm.attr("action","/sboard/list");
	jobForm.find("[name='keyword']").val(keyword);
	jobForm.find("[name='searchType']").val(sType);
	jobForm.find("[name='page']").val(1);
	jobForm.submit();
});


</script>

				</div>
				<!-- /.box-body -->
			</div>
			</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
</div>
</div>    
    
<%@include file="../include/footer.jsp"%>