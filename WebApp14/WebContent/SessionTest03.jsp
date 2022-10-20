<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SessionTest03.jsp
	request.setCharacterEncoding("UTF-8");
	
	
	String userName = (String)session.getAttribute("userName");
	

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<h2><%=userName %>님, </h2>
	<h2>친구 관리 페이지입니다.</h2>
</div>

</body>
</html>