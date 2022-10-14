<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> 일 경우 에러 발생 --%>
<%-- <%@ page buffer="10kb" autoFlush="false" %> 일 경우 정상 처리 --%>
<%@ page buffer="1kb" autoFlush="true" %>


<%
	request.setCharacterEncoding("UTF-8");
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive01.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 추가 관찰</h1>
	<hr>
</div>


<div>
	<h2>buffer 속성 및 autoFlush</h2>
	
	<h3>반복문 구성</h3>
	
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
	
</div>






</body>
</html>