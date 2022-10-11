<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send02.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습 02
	
	   - 이름과 국어점수, 영어점수, 수학점수를 서버로 전송하여
	     (Send02.html)
	     
	     총점, 평균에 대한 결과를 받을 수 있는 JSP 페이지를 구현한다.
	     (Receive02.jsp)
	     
	   - 페이지 레이아웃
	     --------------------------------------------------
	     
	     이름      [            ]
	     국어점수  [            ]
	     영어점수  [            ]
	     수학점수  [            ]
	     
	     < 성적처리 >
	     
	     --------------------------------------------------
	     
	   - 성적처리 버튼 클릭 시
	     『홍길동님, 성적처리가 완료되었습니다.
	       회원님의 점수는 국어:xx점, 영어:xx점, 수학:xx점 입니다.
	       총점은 xxx점, 평균은 xx.x점 입니다.』
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	     (Receive01.jsp)
	     
	   - 사용자의 최초 요청 페이지는
	     『http://localhost:8090/WebApp06/Send02.jsp』로 한다.
-->


	<div>
		<h1>데이터 송수신 관련 실습 02</h1>
		<hr>
	</div>
	
	<div>
		<form action="/WebApp06/Receive02.jsp" method="get">
			<table>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="userName" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>국어점수</th>
					<td>
						<input type="text" name="korScore" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>영어점수</th>
					<td>
						<input type="text" name="engScore" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>수학점수</th>
					<td>
						<input type="text" name="matScore" class="txt">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn" style="width: 152px;">성적처리</button>
						<button type="reset" class="btn" style="width: 152px">초기화</button>
					</td>
				</tr>
			</table>
		
		</form>
	</div>
</body>
</html>