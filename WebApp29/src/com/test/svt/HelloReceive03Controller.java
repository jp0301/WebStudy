
/*======================================
 * HelloSend03Controller.java
 * =====================================
 */


package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.logic.HelloReceive03Model;

public class HelloReceive03Controller extends HttpServlet
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
		request.setCharacterEncoding("UTF-8");
		
		//Model 객체 연결 →  업무 로직 수행 → View 정보 얻어내기
		HelloReceive03Model model = new HelloReceive03Model();
		
		String viewAdvice = model.process(request, response);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewAdvice);
		dispatcher.forward(request, response);
	}
	
	
	
}
