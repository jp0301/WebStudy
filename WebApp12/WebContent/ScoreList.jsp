<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	StringBuffer list = new StringBuffer();
	
	ScoreDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		memberCount += dao.count() + "명</span>";
		
		list.append("<table class='scoreTable'>");

		list.append("<tr>");
		list.append("<th class='title'>번호</th>");
		list.append("<th class='title'>이름</th>");
		list.append("<th class='title'>국어</th>");
		list.append("<th class='title'>영어</th>");
		list.append("<th class='title'>수학</th>");
		list.append("<th class='title'>총점</th>");
		list.append("<th class='title'>평균</th>");
		list.append("</tr>");
	
		for(ScoreDTO dto : dao.list())
		{
			list.append("<tr>");
			list.append("<td>" + dto.getSid() + "</td>");			
			list.append("<td>" + dto.getName() + "</td>");			
			list.append("<td>" + dto.getKor() + "</td>");			
			list.append("<td>" + dto.getEng() + "</td>");			
			list.append("<td>" + dto.getMat() + "</td>");			
			list.append("<td>" + dto.getTot() + "</td>");			
			list.append("<td>" + dto.getAvg() + "</td>");			
			list.append("</tr>");
		}
		
		list.append("</table>");

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
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">


<style type="text/css">
	.systemTitle {
		color: black;
		background-color: #fff;
		border: 1px solid #3A485E;
		border-radius: 5px;
		width: 405px;
		box-shadow: 3px 3px 3px #2B3442;
		text-align: center;
		padding: 5px;
	}
	
	input {
		padding: 5px;
		width: 330px;
		border: 1px solid #3A485E; 
		border-radius: 5px;
		box-shadow: 3px 3px 3px #2B3442;
	}
	
	input:focus {
		background-color: #CBE2FF;
	}
	body {
		background-color: #4B576B;
		color: white;
	}

	.countDiv {
		margin-bottom: 20px;
	}
	#memberCount {
		font-size:15px;
		font-weight: bold;
		margin-left: 285px;
		border: 1px solid black;
		border-radius: 5px;
		padding: 5px;
		box-shadow: 3px 3px 3px #2B3442;
		background-color: white;
		color: black;
	}

	.errorMsg {
	font-size: small;
		color: red;
		display: none;
	}
	table {
		border-radius:5px;
	}
	
	.scoreTable {
		border: 1px solid black;
		border-radius:5px;
		padding: 5px;
		box-shadow: 5px 5px 5px #2B3442;
		background-color: white;
		color: black;
	}
	
	.title {
		padding-left: 12px;
		padding-right: 12px;
		backgound-color: #586BA0;
		border-bottom: 1px dotted black;
	}
	
	td {
		padding: 5px;
		text-align: center;
	}
	
	.btn2 {
		cursor: pointer;
		color: #fff;
		background-Color: #586BA0;
		border: 1px solid #3B476A;
		border-radius: 10px;
		padding: 10px;
		margin-left: 210px;
		transition: .5s;
		box-shadow: 5px 5px 5px #2B3442;
	}
	
	.btn2:hover {
		background-color: #B8D5FF;
		color: #203966;
		transition: .5s;
		transform: scale(1.2, 1.2);
	}
	.resetBtn {
	margin-left: 15px;
		cursor: pointer;
		color: #fff;
		background-Color: #EC7185;
		border: 1px solid #B94A5C;
		border-radius: 10px;
		padding: 10px;
		transition: .5s;
		box-shadow: 5px 5px 5px #2B3442;
	}
	
	.resetBtn:hover {
		color: #FFD5E2;
		background-Color: #B94A5C;
		border: 1px solid #622A34;
		border-radius: 10px;
		padding: 10px;
		transform: scale(1.2, 1.2);
		transition: .5s;
	}
	
</style>

<script type="text/javascript">
	
	function formCheck() {		
		var userName = document.getElementById("userName");
		var korScore = document.getElementById("korScore");
		var engScore = document.getElementById("engScore");
		var matScore = document.getElementById("matScore");

		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none"; 
		matMsg.style.display = "none";
		
		if(userName.value == "")
		{
			nameMsg.style.display = "inline";
			return false;
		}
		if(korScore.value == "")
		{
			korMsg.style.display = "inline";
			return false;
		}
		if(engScore.value == "")
		{
			engMsg.style.display = "inline";
			return false;
		}
		if(matScore.value == "")
		{
			matMsg.style.display = "inline";
			return false;
		}
		
		return true;
	}

</script>


</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>
	
<div>
	<h2 class="systemTitle">😮</h2>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" >
				</td>
				<td>
					<span class="errorMsg" id="nameMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="korScore" name="korScore" >
				</td>
				<td>
					<span class="errorMsg" id="korMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="engScore" name="engScore" >
				</td>
				<td>
					<span class="errorMsg" id="engMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="matScore" name="matScore" >
				</td>
				<td>
					<span class="errorMsg" id="matMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn2">성적 데이터 등록</button>
					<button type="reset" class="resetBtn">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div class="countDiv">
	<%=memberCount %>
</div>
<div>
<!-- 테이블 전체 조회 출력 -->
	<%=list %>
</div>


</body>
</html>