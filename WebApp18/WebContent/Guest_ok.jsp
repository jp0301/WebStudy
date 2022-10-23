<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="gs" class="com.test.GuestDTO" scope="page"></jsp:useBean>

<jsp:setProperty property="*" name="gs" />




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<p>작성된 내용 확인</p>
	
	<h3>이름 : <%=gs.getUserName() %></h3>
	<h3>제목 : <%=gs.getSubject() %></h3>
	<h3>내용</h3>
	<%=gs.getContent().replaceAll("\n", "<br>") %><br>


</div>

</body>
</html>