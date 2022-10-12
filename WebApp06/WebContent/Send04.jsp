<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04.jsp</title>


<script type="text/javascript">

	function register()
	{
		
		var id = document.getElementById("Id").value;
		var pwd = document.getElementById("Pwd").value;
		var name = document.getElementById("Name").value;
		var tel = document.getElementById("Tel").value;

		
		var result = "";
		
		if (id == "")
		{
			result1 = document.getElementById("idError");
			result1.innerHTML = "아이디를 입력해야 합니다.";
			return;
		}
		if(pwd == "")
		{
			result2 = document.getElementById("pwdError");
			result2.innerHTML = "비밀번호를 입력해야 합니다.";
			return;
		}
		if(name == "")
		{
			result3 = document.getElementById("nameError");
			result3.innerHTML = "이름을 입력해야 합니다.";
			return;
		}
		if(tel == "")
		{
			result4 = document.getElementById("telError");
			result4.innerHTML = "전화번호를 입력해야 합니다.";
			return;
		}
		
/* 		var checkObj = document.getElementByName("check");
		var flag = true;
		
		for (var i = 0; i < check.length; i++)
		{
			if (checkObj[i].checked)
			{
				flag = false;
			}
		}
		
		if(flag)
		{
			alert("없어");		
		}
		 */

		document.getElementById("form").submit();
	}
	
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
	<h1>데이터 송수신 관련 실습04</h1>
	<hr>
</div>
	
	
	<div>
		<form id="form" action="Receive04.jsp" method="get">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="Id" name="userId" class="txt">
					</td>
					<td id="idError" style="color: red;">
					</td>
				</tr>
				
				<tr>
					<th>패스워드</th>
					<td>
						<input type="text" id="Pwd"  name="userPwd" class="txt">
					</td>
					<td id="pwdError">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="Name"  name="userName" class="txt">
					</td>
					<td id="nameError">
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="Tel"  name="userTel" class="txt">
					</td>
					<td id="telError">
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="check" value="여자" id="check1">여자</label>
						<label><input type="radio" name="check" value="남자" id="check2">남자</label>
					</td>
					<td id="genderError">
					</td>
				</tr>
				
				<tr>
					<th>지역</th>
					<td>
						<select name="region">
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="강원">강원</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>수강과목</th>
					<td>
						<label><input type="checkbox" name="sub1" value="자바기초" id="sub1">자바기초</label>
						<label><input type="checkbox" name="sub2" value="오라클중급" id="sub2">오라클중급</label>
						<label><input type="checkbox" name="sub3" value="JDBC" id="sub3">JDBC</label>
						<label><input type="checkbox" name="sub4" value="JSP심화" id="sub4">JSP심화</label>
					</td>
				</tr>
				
				<tr>
				<td colspan="2">
					<button type="button" onclick="register()">회원 가입</button>
				</td>
				</tr>
				
				
			</table>
		</form>
	</div>
	
	
	
	
</body>
</html>