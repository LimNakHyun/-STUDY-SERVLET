<%@ page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article=(BoardBean)request.getAttribute("article");
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


<script type="text/javascript">
function replyboard(){
	boardform.submit();
}
</script>
<script language="javascript">
</script>

</head>
<body>
	<!-- 게시판 답변 -->
	
	
	<section>
		<h3 align="center">답글 작성</h3>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		
		<form action="boardReplyPro.bo" method="post" name="boardform">
		<input type="hidden" name="page" value="<%=nowPage %>" />
		<input type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM() %>">
		<input type="hidden" name="BOARD_RE_REF" value="<%=article.getBOARD_RE_REF() %>">
		<input type="hidden" name="BOARD_RE_LEV" value="<%=article.getBOARD_RE_LEV() %>">
		<input type="hidden" name="BOARD_RE_SEQ" value="<%=article.getBOARD_RE_SEQ() %>">
		<table class="table table-condensed">
			<tr>
				<td><label for="BOARD_NAME">글쓴이</label></td>
				<td><input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required"/></td>
			</tr>
			<tr>
				<td><label for="BOARD_PASS">비밀번호</label></td>
				<td><input name="BOARD_PASS" type="password" id="BOARD_PASS" required="required"/></td>
				</tr>
				<tr>
				<td><label for="BOARD_SUBJECT">제 목</label></td>
				<td><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required"/></td>
			</tr>
			<tr>
				<td><label for="BOARD_CONTENT">내 용</label></td>
				<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required="required"></textarea></td>
			</tr>
		</table>
			<section  align="center">
				<input type="submit" value="답글달기">&nbsp;&nbsp;
				<!-- <button type="button" onclick="location.href='javascript:replyboard()'">답글달기</button> -->
				<!-- <a href="javascript:replyboard()">[답글달기]</a>&nbsp;&nbsp; -->
				
				<button type="button" onclick="location.href='javascript:history.go(-1)'">이전으로</button>
				<!-- <a href="javascript:history.go(-1)">[이전으로]</a> -->
			</section>
		</form>
	</section>
</body>
</html>