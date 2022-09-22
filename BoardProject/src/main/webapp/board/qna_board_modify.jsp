<%@ page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
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
	function modifyboard(){
		modifyform.submit();
	}
	</script>

</head>
<body>
<!-- 게시판 등록 -->

<section>
<h3 align="center">게시판글수정</h3>
<form action="boardModifyPro.bo" method="post" name = "modifyform">
<input type = "hidden" name = "BOARD_NUM" value = "<%=article.getBOARD_NUM()%>"/>
<input type="hidden" name="page" value="<%=nowPage%>"/>
<table class="table table-bordered">
	<tr>
		<td><label for = "BOARD_NAME">글쓴이</label></td>
		<td><input type = "text" name="BOARD_NAME" id = "BOARD_NAME" value = "<%=article.getBOARD_NAME()%>" required="required"/>
		</td>
	</tr>
	<tr>
		<td><label for = "BOARD_PASS">비밀번호</label></td>
		<td><input name="BOARD_PASS" type="password" id = "BOARD_PASS"/>
		</td>
	</tr>
	<tr>
		<td><label for = "BOARD_SUBJECT">제 목</label></td>
		<td><input name="BOARD_SUBJECT" type="text" id = "BOARD_SUBJECT" value = "<%=article.getBOARD_SUBJECT()%>" required="required"/>
		</td>
	</tr>
	<tr>
		<td><label for = "BOARD_CONTENT">내 용</label></td>
		<td><textarea id = "BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required="required"><%=article.getBOARD_CONTENT()%></textarea>
		</td>
	</tr>
</table>
	<section align="center">
		<input type="submit" value="수정하기">&nbsp;&nbsp;
		<!-- <button type="button" onclick="location.href='javascript:modifyboard()'">수정하기</button>&nbsp;&nbsp; -->
		<!-- <a href="javascript:modifyboard()">[수정하기]</a>&nbsp;&nbsp; -->
		
		<button type="button" onclick="location.href='javascript:history.go(-1)'">이전으로</button>
		<!-- <a href="javascript:history.go(-1)">[이전으로]</a> -->
	</section>
</form>
</section>
</body>
</html>