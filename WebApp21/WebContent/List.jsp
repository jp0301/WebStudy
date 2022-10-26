<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();
	
	
	// 이전 페이지(List.jsp 혹은 Article.jsp)로부터 넘어온 데이터 수신(확인)
	//-- pageNum(페이지 번호)
	String pageNum = request.getParameter("pageNum");
	
	// 현재 표시되어야 하는 페이지(가정)
	int currentPage = 1;
	
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	
	// (추가) 검색 키와 검색 값 수신 → 검색 기능을 추가하며 코드 추가
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	
	if (searchKey != null) //-- 검색 기능을 통해 페이지가 요청되었을 경우...
	{
		// 페이지를 요청하며 넘긴 데이터의 처리 방식이 GET 방식이라면...
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			// 데이터 -> 코드 인코딩 / 코드 -> 데이터 디코딩
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		//-- 이와 같은 처리는
		//   GET 방식은 한글 문자열을 별도의 인코딩 과정을 거쳐서 전송하기 때문이다.
	}
	else				   //-- 검색 기능을 사용하지 않은 상태에서 페이지가 요청되었을 경우...
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	
	// 전체 데이터 갯수 구하기 → 검색 기능을 추가하며 코드 수정
	/* 1. int dataCount = dao.getDataCount(); */
	/* 2. int dataCount = dao.getDataCount(검색항목, 검색값); */
	int dataCount = dao.getDataCount(searchKey, searchValue);		
	
	// 전체 데이터를 기준으로 총 페이지 수 계산
	int numPerPage = 10; //-- 한 페이지에 표시할 데이터 갯수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	// 전체 페이지 수 보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로 구성
	//-- 한 마디로, 데이터를 삭제해서 페이지가 줄었을 경우
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	// 데이터베이스로부터 가져올 시작과 끝 위치
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	
	// 게시물 목록 얻어오기 → 검색 기능을 추가하며 코드 수정
	//List<BoardDTO> list = dao.getList(start, end);
	List<BoardDTO> list = dao.getList(start, end, searchKey, searchValue);
	
	
	// 페이징 처리
	
	String param = "";
	
	// 검색키와 검색값으로 param 구성하는 코드 삽입 가능 → 검색 기능을 추가하며 코드 수정
	// 검색값이 존재한다면...
	if (!searchValue.equals(""))
	{
		param += "?searchKey=" + searchKey;
		param += "?searchValue=" + searchValue;
	}
	
	String listUrl = "List.jsp" + param;
	String pageIndexList = myUtil.getIndexList(currentPage, totalPage, listUrl);
	
	
	// 글 내용 보기 주소
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	else
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	
	DBConn.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">

<script type="text/javascript">

	function sendIt()
	{
		//alert("검색 버튼 클릭~!!!");
		var f = document.searchForm;
		
		// 검색 키워드에 대한 유효성 검사 코드 활용 가능~!!!
		
		var searchKey = f.searchKey.value;
		
		f.action = "<%=cp %>/List.jsp";
		
		f.submit();
	} 
	
	function formSet()
	{
		var searchKey = "<%=searchKey %>";
		var searchValue = "<%=searchValue %>";
		
		var f = document.searchForm;
	}
	
	
</script>


</head>
<body onload="formSet()">

<div id="bbsList">
	
	<div id="bbsList_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- #bbsList_title -->
	
	<div id="bbsList_header">
		<div id="leftHeader">
			<form action="" name="searchForm" method="post">
			
				<select name="searchKey" class="selectFiled">		
					
					<%
					if(searchKey.equals("name"))
					{
					%>
					<option value="subject">제목</option>
					<option value="name" selected="selected">작성자</option>
					<option value="content">내용</option>
					<%
					} else if(searchKey.equals("content")) {
					%>
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content" selected="selected">내용</option>
					
					<%
					} else {
					%>
					<option value="subject" selected="selected">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
					<%
					}
					%>
					
					
				</select>

				<input type="text" name="searchValue" class="textFiled" value=<%=searchValue %>>
				<input type="button" value="검색" class="btn2"
				onclick="sendIt()">
			</form>
		</div><!--  #leftHeader -->
		
		<div id="rightHeader">
			<input type="button" value="글올리기" class="btn2" onclick="javascript:location.href='<%=cp %>/Create.jsp'"/>
			<!-- <input type="button" value="글올리기" class="btn2" onclick="createBoard()"/> -->
		</div><!-- rightHeader -->
		
	</div><!-- #bbsList_header -->

	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div><!-- #title -->
		
		<div id="lists">
		
			<!--
 			<dl>
				<dd class="num">1</dd>
				<dd class="subject">안녕하세요</dd>
				<dd class="name">정미경</dd>
				<dd class="created">2022-09-30</dd>
				<dd class="hitCount">0</dd>
			</dl>
			
			<dl>
				<dd class="num">2</dd>
				<dd class="subject">반갑습니다</dd>
				<dd class="name">조영관</dd>
				<dd class="created">2022-09-30</dd>
				<dd class="hitCount">0</dd>
			</dl>
			-->
			
			 			
			<%
			for(BoardDTO dto : list)
			{
			%>
			<dl>
				<dd class="num"><%=dto.getNum() %></dd>
				<dd class="subject">
					<a href="<%=articleUrl %>&num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
				</dd>
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
			<%
			}
			%>
			
			 
		</div><!-- #lists -->
		
		<div id="footer">
			<!-- <p> 1 Prev 21 22 23 24 25 26 27 28 29 30 Next 52 </p> -->
			<!-- <p> 등록된 게시물이 없습니다. </p> -->
			
			<p>
			<%
			if(dataCount != 0)
			{
			%>
				<!-- 등록된 게시물이 있습니다. -->
				<%=pageIndexList %>
			<%
			}
			else
			{
			%>
				등록된 게시물이 없습니다.
			<%
			}
			%>
			</p>
			
			
		</div><!--  #footer -->
		
	</div><!-- #bbsList_list -->

	
</div><!-- #bbsList -->








</body>
</html>