/* ===========================
	Test1.java
	- 서블릿 관찰
 =============================*/


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		// ① 
		//pw.println("<html><body><h1>name : 조현하<h1><h1>age : 12<h1></body></html>");
		
		// ②
		/*
		String name = "조현하";
		String age = "13";
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name :" + name + "</h1>");
		pw.println("<h1>age :" + age + "세</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ③ 이름과 나이를 web.xml 에서 삽입
		//String name = "조현하";
		//String age = "13";
		//     ↓
		//String name = "web.xml 에서 처리한 이름";
		//String age = "web.xml 에서 처리한 나이";

		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		//   『web.xml』에 『<init-param>』 추가 후~!!!
		/*
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name :" + name + "</h1>");
		pw.println("<h1>age :" + age + "세</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ④ 『web.xml』 에 『<context-param>』
		//String name = "조현하";
		//String age = "13";
		//     ↓
		//String name = "web.xml 에서 처리한 이름";
		//String age = "web.xml 에서 처리한 나이";

		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		//   『web.xml』에 『<init-param>』 추가 후~!!!
		
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name :" + name + "</h1>");
		pw.println("<h1>age : " + age + "세</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		
		
		
	}
}
