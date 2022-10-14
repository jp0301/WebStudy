<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// Forward10_1.jsp
	
	
	request.setCharacterEncoding("UTF-8");
	
	String numStr1 = request.getParameter("num1");
	String numStr2 = request.getParameter("num2");
	String op = request.getParameter("op");
	int num1 = Integer.parseInt(numStr1);
	int num2 = Integer.parseInt(numStr2);
	
	//선택한 연산자에 따라 처리된 연산 결과를 담아낼 변수
	String result= "";
	
	if (op.equals("1"))
		result = String.format("%d + %d = %d\n", num1, num2, (num1+num2));
	else if(op.equals("2"))
		result = String.format("%d - %d = %d\n", num1, num2, (num1-num2));
	else if(op.equals("3"))
		result = String.format("%d * %d = %d\n", num1, num2, (num1*num2));
	else if(op.equals("4"))
		result = String.format("%d / %d = %.1f\n", num1, num2, (num1/(double)num2));
	
	
	request.setAttribute("resultStr", result);
	
	
	// check~!!!
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive10.jsp");
	dispatcher.forward(request, response);
	
	/* -------------------------------------------------------------------------------
	
	■■■ 『RequestDispatcher』 인터페이스 ■■■
	
	※ 이 인터페이스는 『forward()』와 『include()』만 있다. 				-- 둘말고는 쓸일이없겠구나 대신 포워딩에 집중.
	
	※ 처리 과정 및 개념
	   
	   일반적으로 HttpServlet 을 상속받는 클래스... 서블릿.
	   
	   이렇게 작성된 클래스 내부에는
	   실제 요청을 서비스하는 『doGet()』과 『doPost()』 메소드가
	   정의되어 있으며 (『service()』 메소드가 이들의 상위 메소드) 			- 요청은 서비스 주체는 서블릿 컨테이너
	   
																		    1. init() → 리소스 점검, 호출하는 주체는 서블릿 컨테이너
																		    2. service() → doGet()  ┐ - doGetPost() - 호출하는 주체는 서블릿 컨테이너
																		    		   	 → doPost() ┘
																		    3. destroy() - 시동끄는 것, 반납
   
																		   클라이언트는 여러 개, 한 클라이언트에도 요청은 무수히 많다.
																		   하지만 서블릿 컨테이너는 1개. 서블릿은 여러 개
																		                                   └ (서블릿-서블릿 매핑)
	   			 
	   ServletContainer 는 『HttpServlet』의 인스턴스를 생성하고
	   『init()』 메소드를 실행해 주고
	   이 메소드에 의해 매핑된 URL에 (페이지 요청 방식에 따라)
	   doGet() 과 doPost() 중 선택하여 메소드를 호출해 주고(실행시켜 주고),
	   Container 가 종료될 때 『destroy()』 메소드를 호출해 주고,
	   관련된 처리 과정이 마무리 된다.
	   
	   
	   즉, ServletContainer 가
	   init()    → 처음
	   service() → 중간중간 요청이 있을 때마다
	   destroy() → 마지막
	   메소드를 호출한다.
	   (절대 우리가 직접 호출하는 것이 아니다~!!!)
	   
	   결국 『HttpServlet』은
	   하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.
		   
																		   - 클라이언트 요청에 의해 각각 독립된 프로그램이 필요한 방식 cgi 방식
																		   - 하지만 프로그램은 하나만 도는 상태에서 하나의 요청이끝났다고 프로그램을 꺼버리면 나머지 요청들은 어찌할수가없다.
																		   - 따라서 일을 대신할 수 있는 멀티 스레드 활용.
	   
	   
	   이렇게 구성되는 『HttpServlet』의 상속된 클래스의 인스턴스는
	   스레드에 안전하게 설계(멀티 스레드 세이프티)되어야 하고
	   따라서 스레드에 안전하게 설계하지 않은 경우
	   상위 클래스를 마구 접근하게 되어 에러가 발생할 수 밖에 없다.
	   
	   이와 같은 이유로 환경 설정이나 J2EE(엔터프라이즈급) 서비스에 관한 내용은
	   『ServletContext』에서 할 수 있게 된다.
	   (※ 『ServletContext』
			: 서블릿에 대한 환경, 상태 등을 설정할 수 있는 객체)
	   이 『ServletContext』는 『getServletContext()』로만 받을 수 있다.
	   그렇기 때문에 이 『getServletContext()』는
	   동기화가 제대로 구현되어 있을 것이라고 예측할 수 있다.
	   그 이유는 멀티 스레드에 안전하게 설계(세이프티)되어 있어야
	   우리가 『ServletContext』의 『setAttribute()』나 『getAttribute()』를
	   스레드 걱정 없이 마음대로 읽고 쓸 수 있기 때문이다.
	   
	   『ServletContext』의 또 다른 커다란 기능 중 하나는
	   다른 서블릿 인스턴스를 가져올 수 있다거나
	   서블릿 환경 설정값을 가져올 수 있는 기능이다.
	   
																		   나는 혼자야 . 혼자 모든, 여러일을 진행하기 어렵다. 직접 뛰어다닐 수없는데
																		   컨트롤 타워역할을 하면서 리퀘스트디스패쳐를 하수인처럼 다룬다.
	   
	   
	   『RequestDispatcher』 역시 그 기능 중의 하나이다.
	   사전적인 의미로는... 요청을 제공하는 도구
	   즉, 요청을 보내주는 인터페이스이다.
	   
																		   결국은 서블릿으로 되어야 한다. 결국은 다 독립적인 서블릿이다. 
	   
	   현재... 요청을 다른 서블릿(혹은 JSP)으로 보내야 하는 상황.
	   그런데, 위에 언급한 바와 같이 서블릿의 인스턴스는 하나만 생성되고
	   이것이 멀티 스레딩으로 돌아가고 있다.
	   
	   그렇기 때문에 새로운 서블릿을
	   그 서블릿을 실행하는 것 만으로는 안되고
	   이미 돌아가고 있는 서블릿 인스턴스의 스레드를
	   하나 더 추가해야 한다.
	   그리고 이것은 개발자가 처리해야 할 영역을 벗어났기 때문에
	   이 일은 『Dispatcher』가 대신 수행해 준다는 것이다.
	   
	   하지만, 이 『Dispatcher』는
	   『HttpServletRequest』,『HttpServletResponse』를
	   생성해 줄 수는 없다. --전달받은 것을 처리해야되는 것이지 직접 생성할 수는 없다.
	   그렇기 때문에 『Dispatcher』가 생성해준 새로운 서블릿 스레드를
	   실행시키기 위해 『doGet()』이나 『doPost()』를 호출해야 한다.
	   
	   이와 같은 이유로
														   
														                       request : 하수인이 파견지에서 요청받은사항, response: 요청한 결과
														                       서블릿컨텍스트에, 서블릿컨테이너에. 전달된다. 축약하면 서블릿한테 전달된다고 해버려서 헷갈리게된다.
	                       
	   『dispatcher.forward(request, response);』 구문을 통해
	   request 와 response 를 넘겨주는 것이다.
	   
			
	-------------------------------------------------------------------------------- */

%>

