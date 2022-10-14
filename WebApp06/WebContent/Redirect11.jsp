<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect11.jsp
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(Send11.jsp)로부터 데이터 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");

	
	// 연산 처리
	//String result ="";
			
	/* 쿼리 스트링 "+" 결합으로 사용 */
/* 	if (op.equals("1"))
		result = String.format("%d %%2B %d = %d\n", num1, num2, (num1+num2));
	else if(op.equals("2"))
		result = String.format("%d - %d = %d\n", num1, num2, (num1-num2));
	else if(op.equals("3"))
		result = String.format("%d * %d = %d\n", num1, num2, (num1*num2));
	else if(op.equals("4"))
		result = String.format("%d / %d = %.1f\n", num1, num2, (num1/(double)num2));
	

	
 	request.setAttribute("resultStr", result);
	
 	String url = "Receive11.jsp?resultStr=" + result;
	response.sendRedirect(url);
 */	 
 
 
	String str ="";
 	if (op.equals("1"))
 		str += String.format("%d", (num1 + num2));
	else if(op.equals("2"))
		str += String.format("%d", (num1 - num2));
	else if(op.equals("3"))
		str += String.format("%d", (num1 * num2));
	else if(op.equals("4"))
		str += String.format("%d", (num1 / num2));
 	
 	// check~!!!
 	// 결과 데이터 재전송~!!! → sendRedirect() 메소드 사용
 	// ※ response 객체의 주요 메소드 중 하나인
 	// 『sendRedirect(String location)』
 	//  : 지정된 URL(location)로 요청을 다시 전송한다.
 	//    이전의 요청(request)은 이 단계에서 소멸한다.
 	//response.sendRedirect("Receive11.jsp");
 	
 	//response.sendRedirect("Receive11.jsp?num1=" + num1 + "&num2=" + num2 + "&op=" + op + "$str=" + str);
 	
 	// 무지성 띄어쓰기는 피해야한다.
 	//response.sendRedirect("Receive11.jsp?num1=" + num1 + "&num2=" + num2 + "&op=" + op + "$str=" + str);
 	//-- ( Ⅹ )
 	
 	response.sendRedirect("Receive11.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);	
%>