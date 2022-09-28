<%@ page import="vo.PageInfo"%>
<%@ page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- <style>
	.pagination {
		justify-content : center;
	}
</style> -->

<meta name="viewport" content="width=device-width", initial-scale="1">
<title>MVC 게시판</title>

<link rel="stylesheet" href="css/bootstrap.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>

<body>
	<!-- 게시판 리스트 -->
	<section>
		<h2 align="center">로컬 게시판</h2>
		
		<section>
			<form action="boardList.bo" class="navbar-form navbar-left">
				<div class="form-group">
					<input type="search" name="SEARCH_WORD" id="SEARCH_WORD" class="form-control" placeholder="검색">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</section>
		
		<form action="boardWriteForm.bo" method="post" name="boardform">
			<section align="right">
				<button type="submit" class="btn btn-info">글쓰기</button>&nbsp;&nbsp;
			</section>
		<br>
		</form>
		
		<table class="table table-bordered table-striped">
			<%
			if(articleList != null && listCount > 0){
			%>
			
<!--  				<tr align="center" class="info">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr> -->
				
 				<tr align="center" class="info">
					<td class="col-sm-1">번호</td>
					<td class="col-sm-6">제목</td>
					<td class="col-sm-2">작성자</td>
					<td class="col-sm-2">작성일</td>
					<td class="col-sm-1">조회수</td>
				</tr>
				
				<%
				for(int i=0;i<articleList.size();i++){
					
				%>
				<tr>
					<td align="center"><%=articleList.get(i).getBOARD_NUM()%></td>
					<td>
					
				<%if(articleList.get(i).getBOARD_RE_LEV()!=0){ %>
				<%for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2-2;a++){ %>
				&nbsp;
				<%} %>  [Re:]
				<%}else{ %>  <%} %>
					<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
					<%=articleList.get(i).getBOARD_SUBJECT()%>
					</a>
				</td>
				<td align="center"><%=articleList.get(i).getBOARD_NAME() %></td>
				<td align="center"><%=articleList.get(i).getBOARD_DATE() %></td>
				<td align="center"><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<%}else{ %>
		<h2 align="center" class="bg-danger">등록된 글이 없습니다.</h2>
	<%} %>
	
 					<%
					for(int j=0;j<((10-articleList.size())*2)-1;j++){
					%>
					<br>
					<%} %>
					<br>
	<!-- <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->
	

	
<%-- 	<section>
		<form class="navbar-form navbar-center">
		<%if(nowPage<=1){ %>
			<button class="btn btn-default" type="button" disabled>이전</button>&nbsp;
		<%}else{ %>
			<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=nowPage-1 %>'">이전</button>&nbsp;
		<%} %>
		
		<%for(int a=startPage;a<=endPage;a++){
			if(a==nowPage){%>
				<button class="btn btn-primary active" type="button" disabled><%=a %></button>
			<%}else{ %>
				<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=a %>'"><%=a %></button>
			<%} %>
		<%} %>
		
		&nbsp;
		<%if(nowPage>=maxPage){ %>
			<button class="btn btn-default" type="button" disabled>다음</button>
		<%}else{ %>
			<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=nowPage+1 %>'">다음</button>
		<%} %>
		</form>
	</section> --%>
	&nbsp;
<%-- <div class="container">
	<div class="row">
		<div class="col-lg-6 offset-lg-3 py-5 border d-flex">
			<ul class="pagination justify-content-center">
				
				<%if(nowPage<=1){ %>
					<li><a>&laquo;</a>&nbsp;</li>
				<%}else{ %>
					<li><a href="boardList.bo?page=<%=nowPage-1 %>">&laquo;</a>&nbsp;</li>
				<%} %>
				
				<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<li class="page-item active"><a><%=a %></a></li>
					<%}else{ %>
						<li><a href="boardList.bo?page=<%=a %>"><%=a %></a>&nbsp;</li>
					<%} %>
				<%} %>
				
				<%if(nowPage>=maxPage){ %>
					<li><a>&raquo;</a></li>
				<%}else{ %>
					<li><a href="boardList.bo?page=<%=nowPage+1 %>">&raquo;</a></li>
				<%} %>
				
			</ul>
		</div>
	</div>
</div> --%>
	<footer align="center" valign="bottom">
		<%if(nowPage<=1){ %>
			<button class="btn btn-default" type="button" disabled>이전</button>&nbsp;
		<%}else{ %>
			<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=nowPage-1 %>'">이전</button>&nbsp;
			<%-- <a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp; --%>
		<%} %>
		
		<%for(int a=startPage;a<=endPage;a++){
			if(a==nowPage){%>
				<button class="btn btn-primary active" type="button" disabled><%=a %></button>
				<%-- [<%=a %>] --%>
			<%}else{ %>
				<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=a %>'"><%=a %></button>
				<%-- <a href="boardList.bo?page=<%=a %>">[<%=a %>]</a> --%>
				
			<%} %>
		<%} %>
		&nbsp;
		<%if(nowPage>=maxPage){ %>
			<button class="btn btn-default" type="button" disabled>다음</button>
		<%}else{ %>
			<button class="btn btn-default" type="button" onclick="location.href='boardList.bo?page=<%=nowPage+1 %>'">다음</button>
			<%-- <a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a> --%>
		<%} %>
		
	</footer>

</body>
</html>