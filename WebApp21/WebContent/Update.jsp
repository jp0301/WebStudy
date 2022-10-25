<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<%

	// 수정 액션 요청 시
	// 이전 페이지(Article.jsp)로부터 데이터 수신
	//-- num(게시물 번호), pageNum(페이지 번호)
	
	String strNum = request.getParameter("num");	  //-- 게시물 번호
	String pageNum = request.getParameter("pageNum"); //-- 페이지 번호
	
	int num = Integer.parseInt(strNum);
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	DBConn.close();
	
	
	if(dto == null)
		response.sendRedirect("List.jsp?pageNum=" + pageNum);
	
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">

<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		// alert("ddd"); 함수 호출 확인~!!!
		
		var f = document.myForm;
		
		// 제목 입력 확인 -------------------------------------------
		str = f.subject.value;
		str = str.trim();
		
		// 테스트
		//alert(str);
		
		if (!str)
		{
			alert("\n제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		// ------------------------------------------ 제목 입력 확인
		

		// 이름 입력 확인 ------------------------------------------
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n작성자의 이름을 입력하세요~!!!");
			f.name.focus();
			return;
		}
		
		// ------------------------------------------ 이름 입력 확인
		
		
		// 이메일 검사 ------------------------------------------
		if(f.email.value)
		{
			if(!isValidEmail(f.email.value))
			{
				alert("\n이메일 형식이 올바르지 않습니다~!!!");
				f.email.focus();
				return;
			}
		}
		// ------------------------------------------ 이메일 검사
		
		
		// 패스워드 입력 확인 ------------------------------------------
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
		}
		
		var pwdSource = f.pwdSource.value;
		if(str != pwdSource)
		{	
			// 확인
			alert("기존 패스워드 : " + pwdSource);
			alert("입력 패스워드 : " + str);
			
			
			alert("\n패스워드가 일치하지 않습니다~!!!");
			f.pwd.focus();
			return;
		}	
		
		
		// ------------------------------------------ 패스워드 입력 확인
		
		//check~!!!
		<%-- f.action = "<%=cp %>/Update_ok.jsp";--%>
		<%-- f.action = "<%=cp %>/Update_ok.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>"; --%>
		f.action = "<%=cp %>/Update_ok.jsp";
		
		
		f.submit();
		
	}

</script>


</head>
<body>


	<div id="bbs">

		<div id="bbs_title">
			게 시 판 (JDBC 연동 버전)
		</div>

		<form action="" method="post" name="myForm">

			<div id="bbsCreated">
				<div class=".bbsCreated_bottomLine">
					<dl>
						<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
						<dd>
							<input type="text" name="subject" size="74" maxlength="100" class="boxTF" 
							value="<%=dto.getSubject() %>"/>
						</dd>
					</dl>
				</div> <!-- .bbsCreated_bottomLine -->

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>작 성 자</dt>
						<dd>
							<input type="text" name="name" size="35" maxlength="20" class="boxTF" 
							value="<%=dto.getName() %>"/>
						</dd>
					</dl>
				</div> <!-- close .bbsCreated_bottomLine -->

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>이 메 일</dt>
						<dd>
							<input type="email" name="email" size="35" maxlength="50" class="boxTF" 
							value="<%=dto.getEmail() %>"/>
						</dd>
					</dl>
				</div> <!-- close .bbsCreated_bottomLine -->

				<div id="bbsCreated_content">
					<dl>
						<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
						<dd>
						
							<textarea rows="12" cols="63" name="content" class="boxTA"
							><%=dto.getContent() %></textarea>
							
						</dd>
					</dl>
				</div> <!-- close #bbsCreated_content -->

				<div class="bbsCreated_noLine">
					<dl>
						<dt>패스워드</dt>
						<dd>
						
<%-- 							<input type="password" name="pwd" size="35" maxlength="10" class="boxTF" 
							value="<%=dto.getPwd() %>"/> --%>
							
							<input type ="hidden" name="pwdSource" value="<%=dto.getPwd() %>">
 							<input type="password" name="pwd" size="35" maxlength="10" class="boxTF"/> 

							
							&nbsp;<span style="font-size: 6pt;">(게시물 수정 및 삭제 시 필요~!!!)</span>
						</dd>
					</dl>
				</div> <!-- close .bbsCreated_noLine-->

				<div id="bbsCreated_footer">
					<input type ="hidden" name="num" value="<%=dto.getNum() %>">
					<input type ="hidden" name="pageNum" value="<%=pageNum %>">
				
					<input type="button" value="수정하기" class="btn2" onclick="sendIt()" />
					
					<input type="reset" value="다시입력" class="btn2"
						onclick="document.myForm.subject.focus();" />
						
					<input type="button" value="작성취소" class="btn2"
						onclick="javascript:location.href='<%=cp%>/List.jsp'" />
						
				</div> <!-- close #bbsCreated_footer -->
			</div> <!-- close #bbsCreated -->

		</form>

	</div>


</body>
</html>