<%@ page contentType="text/html; charset=UTF-8"%>

<%


	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String operator = request.getParameter("useOperator");
	
	int result = 0;
	
	switch(operator)
	{
		case "+":
			result = num1 + num2;
			break;
		case "-":
			result = num1 - num2;
			break;
		case "*":
			result = num1 * num2;
			break;
		case "/":
			result = num1 / num2;
			break;
	}
	
	/*
		if(operator.equals("+"))
			result = String.valueOf(num1 + num2);
					:
					:
		else if (operator.equals("/"))
			result = String.format("%.1f", (num1/(double)num2));
	*/
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>데이터 송수신 관련 실습 03</h1>
		<hr>
	</div>
	

<div>
	<p>입력하신 <%=num1 %> 와 <%=num2 %> 의 연산 결과는 <%=result %> 입니다.</p>
</div>
	
</body>
</html>