<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	String str = "";
	
	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table class='scoreTable'>";
	
	str += "<tr>";
	str += "<th class='title'>번호</th>";
	str += "<th class='title'>이름</th>";
	str += "<th class='title'>국어</th>";
	str += "<th class='title'>영어</th>";
	str += "<th class='title'>수학</th>";
	str += "<th class='title'>총점</th>";
	str += "<th class='title'>평균</th>";
	str += "</tr>";

	
	while(rs.next()) {
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("KOR") + "</td>";
		str += "<td>" + rs.getString("ENG") + "</td>";
		str += "<td>" + rs.getString("MAT") + "</td>";
		str += "<td>" + rs.getString("TOT") + "</td>";
		str += "<td>" + String.format("%.1f",rs.getFloat("AVG")) + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	stmt.close();
	rs.close();
	DBConn.close();

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
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
		margin-left: 75px;
		transition: .5s;
	}
	
	.btn2:hover {
		background-color: #26354B;
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
	}
	
	.resetBtn:hover {
		color: #fff;
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
		var uName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		var uKor = document.getElementById("korScore");
		var korMsg = document.getElementById("korMsg");
		
		var uEng = document.getElementById("engScore");
		var engMsg = document.getElementById("engMsg");
		
		var uMat = document.getElementById("matScore");
		var matMsg = document.getElementById("matMsg");
		
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nameMsg.style.display="inline";
			return false;
		}
		
		if(!uKor.value || uKor.value < 0 || uKor.value > 100) {
			korMsg.style.display="inline";
			korMsg.focus();
			return false;
		}
		if(!uEng.value || uEng.value < 0 || uEng.value > 100) {
			engMsg.style.display="inline";
			engMsg.focus();
			return false;
		}
		if(!uMat.value || uMat.value < 0 || uMat.value > 100) {
			matMsg.style.display="inline";
			matMsg.focus();
			return false;
		}
		//isNaN()함수 숫자일 경우 true 숫자가 아닐 경우 false
		
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
	<h2>성적 처리</h2>
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


<div>
	<%=str %>
</div>



</body>
</html>