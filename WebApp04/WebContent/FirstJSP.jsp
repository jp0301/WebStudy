<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자바 코드 수행 영역
	
	String str = "Hello JSP";
	String date = String.format("%tF", java.util.Calendar.getInstance());
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FirstJSP.jsp</title>
</head>
<body>
	야~ 위에서 자바 기반으로 연산한 str 을 이 위치에 작성해서 문서를 그려줘~!!!
	
	<div>
		<h1><%=str %></h1>
	</div>
	
	<!-- 메롱 바보야~!!! -->
	
	<%-- 일꾼 바보야~!!! --%>
	
	
	<div>
		<h2><%=date %></h2>
	</div>
	
	
	
	
</body>
</html>