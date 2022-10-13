<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String temp = request.getParameter("userInput");

	if(temp==null)
		temp = "수신 데이터 없음";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

</style>



</head>
<body>


	<div>
		<h1>데이터 송수신 관련 실습 06_2</h1>
		<hr>
	</div>
	
	<div>
		<form>
			<input type="text" id="userInput" name="userInput" class="txt">
			<br><br>
			
			<button type="submit" class="btn">테스트</button>
			<button type="reset" class="btn">취소</button>
			<br><br>
					
					
			<h2>수신된 데이터 : <%=temp %></h2>
		</form>
	</div>	
	

</body>
</html>