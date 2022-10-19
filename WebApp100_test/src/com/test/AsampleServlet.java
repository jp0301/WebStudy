/*=======================
  Asampleservlet.java
  - 서블릿 샘플
 */

package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AsampleServlet extends HttpServlet
{
   /*사용자 요청이 GET 방식인 경우 Servlet Container에 의해 자동으로 호출되는 메소드 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	/*사용자 요청이 POST 방식인 경우 Servlet Container에 의해 자동으로 호출되는 메소드 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	/*사용자 요청이 GET 방식이든 POST 방식이든 Servlet Container에 의해 자동으로 호출되는 메소드 */
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
}
