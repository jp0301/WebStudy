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
<title>LoadingTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			// alert("테스트");
			
			var params = "name=" + $("#name").val() + "&content=" + $("#content").val();
			
			$.ajax(
			{
				type: "POST"
				, url : "LoadingTest01ok.jsp"
				, data : params
				, success : function(args)
				{
					
					
					
					
					
					
					
					

					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
		// check~!!!
		// $(document).ajaxStart(기능, 동작, 행위).ajaxComplete(기능, 동작, 행위);
		$(document).ajaxStart(function()
		{
			//AJAX 시작 시...
			$("#loading").show();
			$("#resultDiv").hide();
		}).ajaxComplete(function()
		{
			// AJAX 종료 시...
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
		
		if (!$.trim($("#content").val()))
		{
			alert("내용를 입력해야 합니다.");
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

<form>
	이름 <input type="text" id="name" class="txt" /><br>
	내용
	<textarea name="" id="content" cols="50" rows="3" class="txt"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn">
	<br><br>
	
	<div id="loading" style="text-align:center; display: none; ">
		<img src="images/loading01_1.gif" alt="loading" style="align-items:center" />
	</div>
	
	
	<div id="resultDiv">
	
	</div>
	
</form>



</body>
</html>