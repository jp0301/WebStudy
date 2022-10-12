<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");

	
	String gender = request.getParameter("check");
	
	String region = request.getParameter("region");
	

	String sub [] = {request.getParameter("sub1"), request.getParameter("sub2"),
			request.getParameter("sub3"), request.getParameter("sub4")};

	String suball = "";
	for(int i = 0; i<4; i++)
	{
		if(sub[i] == null)
			sub[i] = " ";
		
		suball += sub[i] +" ";
	}
	
	
	
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_1.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>데이터 송수신 관련 실습 04</h1>
		<hr>
	</div>
	

<div>
	아이디:<%=id %> <br>
	패스워드:<%=pwd %> <br>
	이름:<%=name %> <br>
	전화번호:<%=tel %> <br>
	<br><br>
	
	성별:<%=gender %> <br>
	지역:<%=region %> <br>
	수강과목:<%=suball %> <br>
	<br><br>

</div>
	
</body>
</html>