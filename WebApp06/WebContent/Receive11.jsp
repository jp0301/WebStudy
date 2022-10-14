<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* String resultStr = (String)request.getParameter("resultStr"); */

	
	// 이전 페이지(Forward11.jsp)로 부터 넘어온 데이터 수신
	// → resultStr → setAttribute() → getAttribute() → Object 반환
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String str = request.getParameter("str");
	
	// 표현하는 방식에 대한 분기
 	if (op.equals("1"))
 		op = "+";
	else if(op.equals("2"))
		op = "-";
	else if(op.equals("3"))
		op = "*";
	else if(op.equals("4"))
		op = "/";
	
	String resultStr = String.format("%s %s %s = %s", num1, op, num2, str);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>포워드/리다이렉트에서 포워드와 관련한 중요한 실습 02</h1>
	<hr>
</div>



<div>
	연산 결과 : <%=resultStr %>
</div>

</body>
</html>