<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadingTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


	$(function() 
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $("#name").val() + "&tel1=" + $("#tel1").val()
						+ "&tel2=" + $("#tel2").val() + "&tel3=" + $("#tel3").val()
						+ "&region=" + $("#region").val();
			
			$.ajax(
			{
				type: "POST"
				, url: "LoadingTest02ok.jsp"
				, data: params
				, dataType: "json"
				, success: function(args) {
					
					
					var out = "";
					
					for (var idx = 0; idx < args.length; idx++)
					{
						var num = args[idx].num;
						var name = args[idx].name;
						var tel = args[idx].tel;
						var region = args[idx].region;
						
						
						out += "<br> --------------------------------";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 전화번호 : " + tel;
						out += "<br> 지역 : " + region;
						out += "<br> --------------------------------";
					}

					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#tel2").val("");
					$("#tel3").val("");
					$("#name").focus();
					
				}
				, beforeSend: showRequest
				, error: function(e) {
					alert(e.responseText);
				}
			});
		});
		
		$(document).ajaxStart(function()
		{
			$("#loading").show();
			$("#resultDiv").hide();
			
		}).ajaxComplete(function()
		{
			$("#loading").hide();
			$("#resultDiv").show();
		});
		

		
	});


	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus()
			return false
		}
		
		if (!$.trim($("#tel2").val()))
		{
			alert("전화번호를 입력해야 합니다.");
			$("#content").focus();
			return false;
		}


		if (!$.trim($("#tel3").val()))
		{
			alert("전화번호를 입력해야 합니다.");
			$("#content").focus();
			return false;
		}

		return true;
	}
	
</script>
</head>
<body>


<div>
	<h1>jquery의 ajax() 메소드 실습</h1>
	<p>로딩 이미지 적용</p>
	<hr>
</div>

<!-- 이름,   전화번호,        지역 -->
<!-- [   ] [010 ▼]-[  ]-[  ]   [    ▼] -->


<form>
	이름
	<input type="text" id="name" class="txt" />
	<br><br>
	
	전화번호
	<select id="tel1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="043">043</option>
		<option value="031">031</option>
	</select>
	-
	<input type="text" id="tel2" class="txt" />
	-
	<input type="text" id="tel3" class="txt" />
	<br><br>
	
	지역
	<select id="region">
		<option value="경기">경기</option>
		<option value="충북">충북</option>
		<option value="충남">충남</option>
		<option value="강원">강원</option>
	</select>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn">
	<br><br>
	
	
	
	
	
	<div id="loading" style="text-align:center; display: none; ">
		<img src="images/loading30.gif" alt="loading" style="align-items:center" />
	</div>
	
	
	<div id="resultDiv">
	
	</div>
	
</form>




</body>
</html>