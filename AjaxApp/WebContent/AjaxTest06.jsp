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
<style type="text/css">
	#search
	{
		width: 500px;
	}
	
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 70px;
		top: 34px;
		
		display: none;
	}
	
	#list .item
	{
		padding: 1px;
	}
	
	#list #footer
	{
		background-color: #ddd;
		text-align: right;
		padding: 2px;
		font-size: small;
	}
</style>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

	function search()
	{
		//alert("테스트");
		
		//데이터 수집(검색용)
		var search = document.getElementById("search").value;
		
		// 검색어로 입력한 내용이 있을 때만 작동한다.
		/* if(search.replace(" ", "") == "")
		{
			document.getElementById("list").style.display = "none";
			return;
		}
		*/
		// 완성형 한글일 경우에만 검색 키워드를 전송할 수 있도록 처리하기
		// → 정규표현식 사용
		var regEx = /^[가-힣]{1,}$/;
		
		if(!regEx.test(search))
			return;
		
		// url 구성
		var url = "test06.do?search=" + search;
		
		// alert(url);
		
		// 객체 생성 : 외주(ajax.js)
		ajax = createAjax();
		
		// 업무 환경 합의
		ajax.open("GET", url, true);
		
		// 업무 시간 합의
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 업무 시작
				callBack();
			}
		}
		// 업무 시작 사실 노동부(서버) 발송
		ajax.send("");
	}
	
	function callBack()
	{
		// Test06Ok.jsp 에서 작성한 xml 수신
		var doc = ajax.responseXML;
		
		// 수신한 xml 문서의 최상단 엘리먼트 선택
		var root = doc.documentElement;
		
		// 선택한 엘리먼트(list) 하위의 item 선택(전부!)
		var itemList = root.getElementsByTagName("item");
		
		// ▷ ajax.responseXML.document.getElementByTaName("item");
		
		//만약 추천 검색 키워드가 없다면
		/*
		if(itemList.length == 0)
		{
			document.getElementById("items").innerText = "추천 검색어가 없습니다.";
			document.getElementById("footer").innerText = "추천 검색어";
			
			document.getElementById("list").style.display = "inline";
		}
		*/
		
		// items 박스 초기화
		document.getElementById("items").innerHTML = "";
		
		// 추천 검색 키워드가 있다면 삽입
		for (var i = 0; i < itemList.length; i++)
		{
			var word = itemList[i].firstChild.nodeValue;
			
			document.getElementById("items").innerHTML
					+= "<div class='item'>" + word + "</div>";
		}
		
		// 최종적으로 목록을 화면에 보일 수 있도록 처리하기 : 스타일 제어
		document.getElementById("list").style.display = "block";
	}

</script>

</head>
<body>


<div>
	검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요" onkeyup="search()">
</div>

<div id="list">
	<div id="items">
		<!--
 		<div class="item">가다랑어</div>
		<div class="item">가마솥</div>
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 만드는 법</div>
		<div class="item">가방끈 매듭 풀기</div>
		-->
	</div>
	<div id="footer">
		추천 검색어
	</div>
</div>
</body>
</html>