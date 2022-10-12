<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04_1.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">

<script type="text/javascript">





</script>

</head>
<body>


<!-- 
	○ 데이터 송수신 관련 실습04
	
	   - 회원 가입 요청 및 처리에 대한 과정을 JSP 페이지로 구성한다.
	     
	   - 서버로 전송하기 전에(클라이언트 측에서 작성한 내용을 서버 측에 제출하기 전에)
	     입력 데이터에 대한 기본 검사 과정을 추가한다.
	     즉, 자바스크립트로 필수 입력 항목에 대한 입력 누락 여부 확인  
	     (Send04.jsp)
	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	    
	     아이디(*)    [       ] 
	     패스워드(*)  [       ]
	     이름(*)      [       ] 이름을 입력해야 합니다.
	     전화번호(*)  [       ]
	     
	     성별         ● 여자 ○ 남자
	     지역         [ 서울 ▼ ]
	     수강과목     □ 자바기초 □ 오라클중급 □ JDBC □ JSP심화 -- 다중선택이 가능하다.
	     
	     <회원가입>
	     
	     ------------------------------------------------------------
	     
	   - 회원가입 버튼 클릭 시
	   
	     『아이디: superman
	       패스워드 : 1234
	       이름 : 홍길동
	       전화번호 : 010-1111-1111
	       
	       성별 : 여성
	       지역 : 서울
	       수강과목 : 오라클중급』 
	        
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	  
	  
	   - 사용자의 최초 요청 페이지는
	     ~/Send04.jsp 로 한다.
	     
-->


<div>
	<h1>데이터 송수신 관련 실습04_1</h1>
	<hr>
</div>
	
	
	<div>
		<form id="form" action="Receive04.jsp" method="get">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="userId" name="userId" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" id="userPwd"  name="userPwd" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="userName"  name="userName" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<input type="tel" id="userTel"  name="userTel" class="txt">
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="useGender" value="여성" id="female">여자</label>
						<label><input type="radio" name="useGender" value="남성" id="male">남자</label>
					</td>
				</tr>
				
				<tr>
					<th>지역</th>
					<td>
						<select name="userCity" id="userCity">
							<option value="서울시">서울</option>
							<option value="대전시">경기</option>
							<option value="광주시">경기</option>
							<option value="대구시">경기</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>수강과목</th>
					<td>
						<label><input type="checkbox" name="userSubject" value="자바기초과목" id="check1">자바기초</label>
						<label><input type="checkbox" name="userSubject" value="오라클중급과목" id="check2">오라클중급</label>
						<label><input type="checkbox" name="userSubject" value="JDBC과목" id="check3">JDBC</label>
						<label><input type="checkbox" name="userSubject" value="JSP심화과목" id="check4">JSP심화</label>
					</td>
				</tr>
				
				
				<tr style="height: 10px;">
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="결과 확인"class="btn" onclick="register()">
						<input type="reset" value="취소"class="btn">
					</td>
				</tr>
				
				
			</table>
		</form>
	</div>
	
	
	
	
</body>
</html>