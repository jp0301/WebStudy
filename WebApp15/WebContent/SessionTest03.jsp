<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebApp15/SessionTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">
</head>
<body>

<div>
	<h1>세션 처리</h1>
	<h2>WebApp15/SessionTest03.jsp</h2>
	<hr>
</div>


<div>
	<form action="SessionTest02.jsp" method="post" id="myForm">
		이름 : <%=userName %>
		<br>
		생일 : <%=userBirth %>
		<hr>
		
		아이디 : <%=id %>
		<br>
		패스워드 : <%=pwd %>
		 
	</form>
</div>



</body>
</html>