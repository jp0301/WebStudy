<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--  ○ 포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습 -->

<!--     1. 사칙연산 수행을 위한 정수 입력 페이지를 구성한다. 
         2. 연산자를 함께 입력받을 수 있도록 페이지를 구성한다.
            (Send09.jsp)
              
         3. 사용자의 최초 요청 페이지
            → 『http://localhost:8090/WebApp06/Send10.jsp』

         4. 연산 전용 페이지를 구성한다. → java 혼자 빼려고 하는 것이다. → Servlet
            (Forward10.jsp)
			※ 스크립릿 코드만 존재 → java 코드(+ jsp:forward 액션태그)
			
			
         5. 최종 결과 출력 페이지를 구성한다.
            (Receive10.jsp)
            
-->


<div>
	<h1>포워드/리다이렉트에서 포워드와 관련한 중요한 실습 01</h1>
	<hr>
</div>


<div>

	<form action="Forward10.jsp" method="post">
		정수1 : <input type="text" name="num1" class="txt">
		정수2 : <input type="text" name="num2" class="txt">
		연산자 : 
		<select name="op">
			<option value="0">연산선택</option>
			<option value="1">더하기</option>
			<option value="2">빼기</option>
			<option value="3">곱하기</option>
			<option value="4">나누기</option>			
		</select>
		<br><br>
		
		<button type="submit" class="btn" style="width: 152px;">확인</button>
		
	</form>
</div>

</body>
</html>