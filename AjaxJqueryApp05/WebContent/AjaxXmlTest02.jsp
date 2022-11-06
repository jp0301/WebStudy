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
<title>AjaxXmlTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $.trim($("#name").val())
						+ "&age=" +  $.trim($("#age").val())
						+ "&hobby=" + $.trim($("#hobby").val())
						+ "&count=" + $.trim($("#count").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "AjaxXmlTest02ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(args)
				{
					var out = "";
					
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var id = item.find("id").text();
						var name = item.find("name").text();
						var age = item.find("age").text();
						var hobby = item.find("hobby").text();
						
						out += "<br>=============================";
						out += "<br> >> id = " + id;
						out += "<br> 이름 : " + name;
						out += "<br> 나이 : " + age;
						out += "<br> 취미 : " + hobby;
						out += "<br>=============================";
					});
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#age").val("");
					$("#hobby").val("");
					$("#count").val("");
					$("#name").focus();
					
				}
				, beforeSend : showRequest
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
		
		if (!$.trim($("#age").val()))
		{
			alert("나이를 입력해야 합니다.");
			$("#age").focus();
			return false;
		}
		
		if (!$.trim($("#hobby").val()))
		{
			alert("취미를 입력해야 합니다.");
			$("#hobby").focus();
			return false;
		}
		
		if (!$.trim($("#count").val()))
		{
			alert("아이템 갯수를 입력해야 합니다.");
			$("#count").focus();
			return false;
		}

		return true;
	}

</script>
</head>
<body>


<div>
	<h1>jquery 의 ajax() 관련 실습</h1>
	<p>xml control</p>
	<hr>
</div>

<div>
	이름 <input type="text" id="name" class="txt">
	<br>
	나이 <input type="text" id="age" class="txt">
	<br>
	
	취미 <input type="text" id="hobby" class="txt">
	<br>
	
	아이템 갯수 <input type="text" id="count" class="txt"
	style="width: 50px;">
	
	<input type="button" id="sendBtn" value="전송 확인" />
</div>
<br /><br />

<div id="resultDiv">

<!-- >> id=1<br>
- 이름 : 정영준<br>
- 나이 : 13<br>
- 취미 : 달리기<br>

>> id=2<br>
- 이름 : 정영준2<br>
- 나이 : 13<br>
- 취미 : 달리기2<br>

>> id=3<br>
- 이름 : 정영준3<br>
- 나이 : 13<br>
- 취미 : 달리기3<br> -->

</div>



</body>
</html>