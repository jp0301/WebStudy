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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $.trim($("#name").val())
			           + "&content=" + $.trim($("#content").val());
			
			// 확인
			//alert(params);
			
			//jquery 의 ajax() 함수 사용(호출)
			$.ajax(
			{
				type : "POST"
				, url : "AjaxTest01ok.jsp"
				, data : params
				, success : function(args)
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest //true or false
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
			
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
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		return true;
	}
	
	
	
</script>
</head>
<body>


<div>
	<h1>jquery 의 ajax() 메소드 실습</h1>
	<hr>
</div>

<div>
	이름 <input type="text" id="name" class="txt" />
	<br>
	
	내용
	<textarea name="" id="content" cols="50" rows="3"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" />
	
</div>
<br /><br />


<div id="resultDiv">

</div>

</body>
</html>