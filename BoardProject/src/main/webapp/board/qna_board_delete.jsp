<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
	String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width", initial-scale="1">


<title>MVC 게시판</title>

<!-- <link rel="stylesheet" href="css/bootstrap.css">

합쳐지고 최소화된 최신 CSS
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

부가적인 테마
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

제이쿼리
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

합쳐지고 최소화된 최신 자바스크립트
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

</head>

<body>
	<section align="center">
		<form name="deleteForm" action="boardDeletePro.bo?board_num=<%=board_num %>" method="post" class="form-horizontal">
		<input type = "hidden" name = "page" value = "<%=nowPage %>"/>
			<label>글 비밀번호 : </label>
			<input name="BOARD_PASS" type="password">
			<br><br>
			<input type="submit" value="삭제하기"/>&nbsp;&nbsp;
			<input type="button" value="돌아가기" onClick="javascript:history.go(-1)"/>
		</form>
	</section>
</body>



<%-- <body>
	<section>
		<form name="deleteForm" action="boardDeletePro.bo?board_num=<%=board_num %>" method="post">
		<input type = "hidden" name = "page" value = "<%=nowPage %>"/>
		<table class="table">
			<tr>
				<td>
					<label>글 비밀번호 : </label>
				</td>
				<td>
					<input name="BOARD_PASS" type="password">
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value = "삭제하기"/>&nbsp;&nbsp;
					<input type = "button" value = "돌아가기" onClick="javascript:history.go(-1)"/>
				</td>
			</tr>
		</table>
		</form>
	</section>
</body> --%>
</html>