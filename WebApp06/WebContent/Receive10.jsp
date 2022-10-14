<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	/*
	Integer result = (Integer)request.getAttribute("result");
	*/
	
	
	// 이전 페이지(Forward10.jsp)로 부터 넘어온 데이터 수신
	// → resultStr → setAttribute() → getAttribute() → Object 반환
	
	String resultStr = (String)request.getAttribute("resultStr");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>포워드/리다이렉트에서 포워드와 관련한 중요한 실습 01</h1>
	<hr>
</div>



<div>
	결과값: <%=resultStr %>
</div>

</body>
</html>