<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page import="java.net.URLEncoder" %> --%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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


<!-- <script type="text/javascript">
function writeboard(){
	boardform.submit();
}
</script> -->


</head>
<body>
	<!-- 게시판 등록 -->
	<section>
		<h3 align="center">게시글 작성</h3>
		<form action="boardWritePro.bo" method="post" name="boardform">
			<table class="table table-bordered">
				<tr>
					<td><label for="BOARD_NAME">이름</label></td>
					<td><input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required"/></td>
				</tr>
				<tr>
					<td><label for="BOARD_PASS">비밀번호</label></td>
					<td><input name="BOARD_PASS" type="password" id="BOARD_PASS" required="required"/></td>
				</tr>
				<tr>
					<td><label for="BOARD_SUBJECT">제목</label></td>
					<td><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required"/></td>
				</tr>
				<tr>
					<td><label for="BOARD_CONTENT">내 용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<!-- <tr>
					<td><label for="BOARD_FILE">파일 첨부</label></td>
					<td><input name="BOARD_FILE" type="file" id="BOARD_FILE" required="required" /></td>
				</tr> -->
			</table>
			<section  align="center">
				<input type="submit" value="작성하기">&nbsp;&nbsp;
				<input type="button" value="이전으로" onClick="javascript:history.go(-1)">
<!-- 				<a href="javascript:writeboard()">[작성하기]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[이전으로]</a> -->
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>