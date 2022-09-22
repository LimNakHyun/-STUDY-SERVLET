<%@ page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
	<!-- 게시판 수정 -->
	
	<section>
		<h3 align="center">글 내용 상세보기</h3>
		<table class="table table-bordered">
			<tr>
				<td><label for="BOARD_NAME">작성자</label></td>
				<td><label for="BOARD_NAME"><%=article.getBOARD_NAME() %></label></td>
			</tr>
			<tr>
				<td><label for="BOARD_NUM">글 번호</label></td>
				<td><label for="BOARD_NUM"><%=article.getBOARD_NUM() %></label></td>
			</tr>
			<tr>
				<td><label for="BOARD_SUBJECT">작성일</label></td>
				<td><label for="BOARD_SUBJECT"><%=article.getBOARD_DATE() %></label></td>
			</tr>
			<tr>
				<td><label for="BOARD_SUBJECT">제목</label></td>
				<td><label for="BOARD_SUBJECT"><%=article.getBOARD_SUBJECT() %></label></td>
			</tr>
			<tr>
				<td><label for="BOARD_CONTENT">내 용</label></td>
				<td><textarea id="BOARD_CONTENT" cols="40" rows="15" for="BOARD_CONTENT"><%=article.getBOARD_CONTENT() %></textarea></td>
			</tr>
			<%-- <tr>
				<td><label for="BOARD_FILE">첨부파일</label></td>
				<td><label for="BOARD_FILE">
				<%if(!(article.getBOARD_FILE()==null)){ %>
					<a href="file_down?downFile=<%=article.getBOARD_FILE() %>"><%=article.getBOARD_FILE() %></a>
				<%} %>
				</label></td>
			</tr> --%>
		</table>

		<section  align="right">
			<button type="button" onclick="location.href='boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>'">답글달기</button>&nbsp;&nbsp;
			<%-- <input type="button" value="답글달기" onClick="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>"> --%>
			<%-- <a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">[답글달기] </a> --%>
			
			<button type="button" onclick="location.href='boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>'">수정하기</button>&nbsp;&nbsp;
			<%-- <a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>"> [수정하기] </a> --%>
			
			<button type="button" onclick="location.href='boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>'">삭제하기</button>&nbsp;&nbsp;
			<%-- <a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">[삭제하기] </a> --%>
			
			<button type="button" onclick="location.href='boardList.bo?page=<%=nowPage%>'">목록으로</button>&nbsp;&nbsp;
			<%-- <a href="boardList.bo?page=<%=nowPage%>">[목록으로]</a> --%>
			
		</section>
	</section>

</body>
</html>