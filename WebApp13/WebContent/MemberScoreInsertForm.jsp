<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터 수신
	//-- sid
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");

	String name="";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score = dao.search(sid);
		
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}	
	}
	
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">

<script type="text/javascript">

	function memberScoreSubmit()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(kor.value == "" || isNaN(kor.value) || Number(kor.value) < 0 || Number(kor.value) > 100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		
		if(eng.value == "" || isNaN(eng.value) || Number(eng.value) < 0 || Number(eng.value) > 100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		
		if(mat.value == "" || isNaN(mat.value) || Number(mat.value) < 0 || Number(mat.value) > 100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberScoreForm.submit();
		
	}
	
	
	function memberScoreReset()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");

		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		memberScoreForm.reset();
		kor.focus();
		
	}
	
	

</script>


</head>
<body>

<div>
	<h1>회원 명단 관리 및 입력 페이지</h1>
	<hr>
</div>


<div>
	<a href="MemberScoreSelect.jsp"><button type="button" class="btn">회원 성적 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 데이터 입력 폼 구성 -->
	<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<%=sid %>
				</td>
			</tr>
			
			
			<tr>
				<th>이름</th>
				<td>
					<%=name %>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore" value=<%=kor %>>
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0~100 사이의 국어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore" value=<%=eng %>>
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0~100 사이의 영어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore" value=<%=mat %>>
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0~100 사이의 수학 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
		</table>
		<br><br>
		
		<a href="javascript:memberScoreSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
		
	</form>
</div>



</body>
</html>