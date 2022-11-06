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
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $.trim($("#title").val()) + "&content=" + $.trim($("#content").val());
			
			//$.ajax();
			/* $.ajax({속성:값, 속성:값, 속성:값}); */
			/*
			$.ajax(
			{
				속성:값
				, 속성:값
				, 속성:값
			});
			*/
			
			$.ajax(
			{
				type : "POST"
				, url : "AjaxXmlTest01ok.jsp"
				, data : params
				, dataType : "xml" 				//-- check~!!!
				, success : function(args)
				{
					var out = "";
					
					out = ">> 게시물 갯수 : " + $(args).find("totalDataCount").text() + "<br>";
					
					//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
					// 중요한 부분
					//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
					
					//check~!!!
					$(args).find("comment").each(function()
					{
						var item = $(this); //-- comment 엘리먼트
						var num = item.attr("num");	//-- comment 엘리먼트의 num 속성
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += "<br>=============================";
						out += "<br> 번호 : " + num;
						out += "<br> 제목 : " + title;
						out += "<br> 내용 : " + content;
						out += "<br>=============================";
					});
					
					//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
					
					
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
				}
				, beforeSend :  showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});

	
	function showRequest()
	{
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus()
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
	<h1>jquery 의 ajax() 관련 실습</h1>
	<p>xml control</p>
	<hr>
</div>

<div>
	제목 <input type="text" id="title" class="txt">
	<br>
	내용 <input type="text" id="content" class="txt">
	<br>
	
	<input type="button" id="sendBtn" value="전송 확인" />
</div>
<br /><br />

<div id="resultDiv">

</div>


</body>
</html>