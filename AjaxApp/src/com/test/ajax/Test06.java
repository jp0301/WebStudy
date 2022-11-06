package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test06 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		//한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest06.jsp)로부터 데이터 수신
		//-- search
		String search = request.getParameter("search");
		
		// DB 연결 및 액션 처리
		// 『~ where column like 'search%'』와 같은 쿼리문 수행
		// 업무 정책에 따라
		// 『~ where column like '%search%'』와 같은 쿼리문을 수행하는 것도 가능
		// ▷ 그에 따른 결과 수신
		
		// 이와 같이 조회한 결과를 가지고 자료구조 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if (search.equals("가"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가지"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
		}
		else if (search.equals("가사"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가사 듣기"));
			list.add(new WordDTO("가사 말하기"));
			list.add(new WordDTO("가사 외우기"));
			list.add(new WordDTO("가사 만드는 법"));
		}
		else if (search.equals("가위"))
		{
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가위 갈기"));
			list.add(new WordDTO("가위 날카롭게 만드는 법"));
			list.add(new WordDTO("가위 안전하게 버리는 방법"));
			list.add(new WordDTO("가위 휴대"));
		}
		else if (search.equals("가방"))
		{
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방 손질하기"));
			list.add(new WordDTO("가방 구매"));
			list.add(new WordDTO("가방 추천"));
			list.add(new WordDTO("가방 잃어버리지 않는 법"));
		}
		
		
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test06Ok.jsp");
		dispatcher.forward(request, response);
		
	}
}
