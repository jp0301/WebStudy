/* ===========================
 * Test2.java
 =============================*/


package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
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
		// 이전 페이지(Test2.jsp)로부터 데이터 수신
		//-- name, age
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// 처리 및 가공
		// .......
		String str = "이름 : " + name + "님, 나이 : " + age + "세";
		
		/*
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println(str);
		*/
		
		// 포워딩하는 페이지에 값을 넘겨주기 위한 준비(설정)
		request.setAttribute("result", str);
		//-- result 라는 이름으로 str 값을 Test2_result.jsp 로 넘길 준비(설정)
		
		// 포워딩~!!!
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Test2_result.jsp");
		dispatcher.forward(request,  response);
		
		
		
		
		
	}
}
