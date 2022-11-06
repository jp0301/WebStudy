package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/* 사용자 요청이 GET 방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	/* 사용자 요청이 POST 방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	/* 사용자 요청이 GET 방식이든 POST 방식이든 호출될 수 있도록 구성한  메소드 */
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 이전 페이지(AjaxTest02.jsp)로부터 넘어온 데이터 수신
		//-- n1, n2 / var url = "test02.do?n1=" + n1 + "&n2=" + n2;  이걸로 넘겼기 때문에 n1, n2이다.
		String strN1 = request.getParameter("n1");
		String strN2 = request.getParameter("n2");
		String op = request.getParameter("op");
		
		int n1 = Integer.parseInt(strN1);
		int n2 = Integer.parseInt(strN2);
		
		int result = 0;
		
		switch (op)
		{
			case "add":
				result = n1 + n2;
				break;
			case "sub":
				result = n1 - n2;
				break;
				
			case "mul":
				result = n1 * n2;
				break;
				
			case "div":
				result = n1 / n2;
				break;
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03Ok.jsp");
		dispatcher.forward(request, response);
		
	}
}
