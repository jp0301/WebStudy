/*=====================================
 * HelloReceive03Controller.java
 *=====================================*/

package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.logic.HelloReceive03Model;

public class HelloSend03Controller extends HttpServlet
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
		// View 객체에 대한 연결
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/HelloSend03.html");
		dispatcher.forward(request, response);
		
	}
}