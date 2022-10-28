/* =================================
 * com.test.svt.HelloReceive02.java
 * =================================
 */

package com.test.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
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

	/* 사용자 요청이 GET 방식이든 POST 방식이든 호출될 수 있도록 구성한 메소드 */
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		String title = "결과 수신 페이지";
		String subTitle = "HelloReceive02.java";
		String docType = "<!DOCTYPE html>";
		
		out.print(docType + "\n");
		out.print("<html>\n");
		out.print("<head>\n");
		out.print("<title>\n");
		out.print(title + "\n");
		out.print("</title>");
		out.print("</head>\n");
		out.print("<body bgcolor=\"f0f0f0\">\n");
		out.print("<div>\n");
		out.print("<h1>\n");
		out.print(title + "\n");
		out.print("</h1>\n");
		out.print("<p>\n");
		out.print(subTitle + "\n");
		out.print("</p>\n");
		out.print("<hr>\n");
		out.print("</div>\n");

		out.print("<div>\n");
		out.print("<ul>\n");
		out.print("<li>\n");
		out.print("<b>\n");
		out.print("First Name : ");
		out.print("</b>");
		out.print(request.getParameter("firstName") + "\n");
		out.print("</li>\n");
		
		out.print("<li>\n");
		out.print("<b>\n");
		out.print("Last Name : ");
		out.print("</b>");
		out.print(request.getParameter("lastName") + "\n");
		out.print("</li>\n");
		
		out.print("</ul>\n");
		out.print("</div>\n");
		
		out.print("</body>\n");
		out.print("</html>\n");

		
	}
}
