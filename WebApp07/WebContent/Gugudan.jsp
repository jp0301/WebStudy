<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
		<hr>
	</div>
	
	<div>
		<h2>Gugudan.jsp → Gugudan_ok.jsp</h2>
		<form action="Gugudan_ok.jsp" methos="post">
			<table class="table">
				<tr>
					<th>원하는 단 입력</th>
					<td>
						<input type="text" name="dan" class="txt">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="결과 확인" class="btn" style="width: 100%">
					</td>
				</tr>
				
					
			</table>
		</form>
	</div>



</body>
</html>