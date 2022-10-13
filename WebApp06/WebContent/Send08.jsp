<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String result = "";
	result += "<ul>";
	for(int i=1; i<=9; i++)
	{
		//result += String.format("<li><a href=''>%d단</a></li>", i);
		//result += String.format("<li><a href='Receive08.jsp?gugudan=%d'>%d단</a></li>",i , i);
		result += String.format("<li><a href='Receive08.jsp?gugudan=%1$d'>%1$d단</a></li>", i);
	}
	
	/*
	int a = 10; int b = 20; int c = 30;
	1$,2$는 생략되어있다.
	System.out.printf("%1$d %2$d %3$d\n", a, b, c); --==>> 10 20 30
	=
	System.out.printf("%3$d %2$d %1$d\n", a, b, c); --==>> 30 20 10
	
	*/
	result += "</ul>";
	
	// ※ GET 방식의 처리
	/*
	1. <form> 태그에서 『method="get"』으로 작성하거나
	   『method="get"』 속성 자체를 생략하는 경우         → GET 방식 처리 가능
	   
	2. URL 을 사용자가 작성하거나 요청하는 경우			  → GET 방식 처리 가능
	   - <a href="http://URL?키=값&키=값...">내용</a>
	   - <form action="http://URL?키=값&키=값..."></form>
	   - window.open("http://URL?키=값&키=값...");
	   - window.location.href="http://URL?키=값&키=값...";
	   - window.location.replac(http://URL?키=값&키=값...);
	   
	*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습08
	
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   
	   - 구구단 리스트를 동적으로 구성하여
	     사용자의 선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	     
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	    	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	    
	     구구단 선택
	     
	     1단
	     2단
	     3단
	     4단
	     
	      :
	      
	     8단
	     9단
	     
	     ------------------------------------------------------------
	     
	   - 단 항목을 선택하여 클릭 시
	     해당 단(구구단)을 출력해주는 형태의 페이지로 구현한다.
	
	   - 사용자의 최초 요청 페이지는  ~/Send08.jsp 로 한다.
	   
-->

	<div>
		<h1>데이터 송수신 관련 실습 08</h1>
		<hr>
	</div>
	
	<div>
		<p>구구단 선택</p>
		<ul>
			
			<!-- 		
			<li>1단</li>
			<li>2단</li>
			<li>3단</li>
			<li>4단</li>
			<li>5단</li>
			<li>6단</li>
			<li>7단</li>
			<li>8단</li>
			<li>9단</li>
			-->
			
			<!-- 		
			<li><a href="">1단</a></li>
			<li><a href="">2단</a></li>
			<li><a href="">3단</a></li>
			<li><a href="">4단</a></li>
			<li><a href="">5단</a></li>
			<li><a href="">6단</a></li>
			<li><a href="">7단</a></li>
			<li><a href="">8단</a></li>
			<li><a href="">9단</a></li>
			-->
			
			<%=result %>
			
			
		</ul> 
	</div>

</body>
</html>