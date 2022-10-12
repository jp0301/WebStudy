<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("list"));

	StringBuffer sb = new StringBuffer();
	for(int i=1; i<10; i++)
		sb.append(String.format("%d * %d = %d <br>", num, i, (num*i)));
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>데이터 송수신 관련 실습 05</h1>
		<hr>
	</div>
	<div>
		<%=sb %>
	</div>

<div>

</div>
	
</body>
</html>