<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send03.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>


<!-- 
	○ 데이터 송수신 관련 실습03
	
	   - 두 개의 정수와 선택한 연산자를 서버로 전송하여
	     (Send03.jsp)
	     
	     해당 연산에 대한 결과를 받을 수 있는 JSP 페이지를 작성한다.
	     (Receive03.jsp)
	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	     
	     정수1     연산자       정수2
	     [   x   ] [더하기 ▼ ] [   y    ]
	     
	     <연산 결과>
	     
	     ------------------------------------------------------------
	     
	   - 연산결과 버튼 클릭 시
	     『입력하신 x 와 y 의 연산 결과는 z 입니다.』 
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	     
	   - 사용자의 최초 요청 페이지는
	     ~/Send03.jsp 로 한다.
	     
	   - 즉, 두 개의 정수와 연산자를 서버로 전송하여
	     합, 차, 곱, 몫(나누기 연산)을 계산하여
	     결과를 처리하는 JSP 페이지를 작성한다.
-->

	<div>
		<h1>데이터 송수신 관련 실습 03</h1>
		<hr>
	</div>
	

<div>
	<form action="/WebApp06/Receive03.jsp" method="get">
		<table style="background-Color: #3D465B; border-radius: 5px;">
			<tr style="color: #fff; padding: 25px;">
				<th>정수1</th>
				<th>연산자</th>
				<th>정수2</th>
			</tr>
		
			<tr>
				<td>
					<input type="text" name="num1" style="padding: 10px; font-Size: 16px;">
				</td>
			
				<td>
					<select name="useOperator" style="padding: 10px;">
						<option value="+" selected="selected">더하기</option>
						<option value="-">빼  기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
				
				
				<td>
					<input type="text" name="num2" style="padding: 10px; font-Size: 16px;">
				</td>
			</tr>
		

			
			<tr>
				<td colspan="3" align="center">
					<button type="submit" class="btn" style="width: 100%; padding: 15px; font-Size: 14px; border-radius: 5px;">연산결과</button>
				</td>
			</tr>
	
		</table>
	</form>
</div>


</body>
</html>