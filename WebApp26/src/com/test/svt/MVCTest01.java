package com.test.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
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

		/*
		 * String str = "";
		 * 
		 * for (int i = 1; i <= 100; i++) { str += i + " ";
		 * 
		 * if(i % 10 == 0) str += "<br>"; }
		 * 
		 * request.setAttribute("str", str);
		 */
		
		// 1부터 100까지의 수를 객체(컬렉션)에 저장하는 과정
		List<String> list = new ArrayList<String>();
		for (int i = 1; i <=100; i++)
			list.add(String.valueOf(i));
			
		// 1부터 100까지의 수가 저장된 객체(컬렉션)를
		// 뷰(View) 페이지로 넘겨주기 위한 준비
		request.setAttribute("list", list);

		// 포워딩~
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
		dispatcher.forward(request, response);

		
		
		
	}
}
