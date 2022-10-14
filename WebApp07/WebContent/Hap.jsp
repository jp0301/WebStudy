<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
		<hr>
	</div>
	
	
	<div>
		<h2>Hap.jsp → Hap_ok.jsp</h2>
		<!-- action 속성 : 『Hap_ok.jsp』로 지정해도 되고 『/WebApp07/Hap_ok.jsp』 형태로 지정해도 된다. -->
		<form action='Hap_ok.jsp'>
			
			<!--  name 속성 check~!!!
			      스크립트로 처리해서 넘길거라면 name이 아니어도 되지만 폼에 있는 걸 바로 submit 해서 넘길거라면 name을 써라.--> 
			정수1 : <input type="text" name="su1" class="txt"><br>
			정수2 : <input type="text" name="su2" class="txt"><br>
			<br>
			
			<input type="submit" value="결과 확인" class="btn">
			
		</form>
	</div>
	
	
	
	
	
	
</body>
</html>