<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	//AjaxJsonTest03ok.jsp
	
	// AjaxJsonTest01ok.jsp 내용 복사해서 붙여넣었음.
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result ="";
	
	// ※ Json 데이터 구성
	// {"키1" : "값1", "키2" : "값2", ...
	/*
	StringBuffer sb = new StringBuffer();
	
	sb.append("{\"num\":\"" + 1 + "\"");
	sb.append(",\"name\":\"" + name + "\"");
	sb.append(",\"content\":\"" + content + "\"}");
		
	// {"num" : "1", "name" : "최동현", "content" : "내용"} 
	
	// ↓ 
	
	// "{\"num\" : \"1\", \"name\" : \"최동현\", \"content\" : \"내용\"}" 
	
	result = sb.toString();
	
	out.print(result);
	*/
	
	// 위 처럼 구성한 코드를 라이브러리 다운 후 어떻게 바뀌는지...
	
	JSONObject jobj = new JSONObject();
	jobj.put("num", 100);
	jobj.put("name", name);
	jobj.put("content", content);
	
	out.println(jobj.toString());
	
	
	/*
	■■■ JSON 라이브러리 ■■■
	
	① json-lib-2.4-jdk15.jar    			→ 핵심 기본 라이브러리
	② commons-beanutils-1.9.4.jar			→ 의존관계 필수 라이브러리
	③ commons-logging-1.2.jar 				→ 의존관계 필수 라이브러리
	④ commons-collections-3.2.2.jar     	→ 의존관계 필수 라이브러리
	⑤ commons-lang-2.6.jar					→ 의존관계 필수 라이브러리
	⑥ ezmorph-1.0.6.jar					→ 의존관계 필수 라이브러리
	
	---------------------------------------------------------------------------------------
	
	※ 핵심 기본 라이브러리
	1. 『http://www.json.org/』 요청 및 접근
	2. 페이지 하단의 Java 카테고리 『Json-lib』 클릭 
	    → http://json-lib.sourceforge.net/
	3. 페이지 왼편 메뉴 중 『Download』 클릭
	    → https://sourceforge.net/projects/json-lib/files
	4. 페이지 중앙의 『Download Latest Version - json-lib-2.4-jdk15.jar (159.1 kB)』 클릭
	    → 『json-lib-2.4-jdk15.jar』 파일 다운로드
	    
	---------------------------------------------------------------------------------------
	
	※ 의존관계 필수 라이브러리(commons-beanutils-1.9.4-bin.zip)
	1. 『http://json-lib.sourceforge.net』 요청 및 접근
	2. 페이지 하단의 『Dependencies report』 클릭
	   → 『https://json-lib.sourceforge.net/dependencies.html』
	3. 페이지 중간의『Dependency Tree』 항목으로 이동하여
	   『commons-beanutils:commons-beanutils:jar』 항목 클릭
	   → 페이지 내의 특정 위치로 이동
	4. 『http://commons.apache.org/beanutils/』 클릭
	   → 『https://commons.apache.org/proper/commons-beanutils/』
	5. 페이지 왼편의 『Download』 클릭
	   → 『https://commons.apache.org/proper/commons-beanutils/download_beanutils.cgi』
	6. 페이지 중간의 『commons-beanutils-1.9.4-bin.zip』 클릭
	   → 『commons-beanutils-1.9.4-bin.zip』 파일 다운로드
    
	---------------------------------------------------------------------------------------
	   
	※ 의존관계 필수 라이브러리(commons-logging-1.2-bin.zip)
	1. 『http://json-lib.sourceforge.net』 요청 및 접근
	2. 페이지 하단의 『Dependencies report』 클릭
	   → 『https://json-lib.sourceforge.net/dependencies.html』
	3. 페이지 중간의『Dependency Tree』 항목으로 이동하여
	   『commons-logging:commons-logging:jar』 항목 클릭
    4. 페이지 하단의 『http://commons.apache.org/logging』 클릭
       → https://commons.apache.org/proper/commons-logging/
    5. 페이지 왼편의 『Download』클릭 
       → https://commons.apache.org/proper/commons-logging/download_logging.cgi
    6. 페이지 중간의 『commons-logging-1.2-bin.zip』 클릭
       → 『commons-logging-1.2-bin.zip』 파일 다운로드
       
   	---------------------------------------------------------------------------------------
	   
   	※ 의존관계 필수 라이브러리(commons-collections-3.2.2-bin.zip)
   	1. 『http://json-lib.sourceforge.net』 요청 및 접근
   	2. 페이지 하단의 『Dependencies report』 클릭
   	   → 『https://json-lib.sourceforge.net/dependencies.html』
   	3. 페이지 중간의『Dependency Tree』 항목으로 이동하여
	   『commons-collections:commons-collections:jar』 항목 클릭
	   → 페이지 내의 특정 위치로 이동
	4. 페이지 상단의 『http://commons.apache.org/collections/』클릭
	   → https://commons.apache.org/proper/commons-collections/
    5. 페이지 왼편의 『Download』클릭 
       → https://commons.apache.org/proper/commons-collections/download_collections.cgi
       
    6. 페이지 하단의 『commons-collections-3.2.2-bin.zip』 클릭
       → 『commons-collections-3.2.2-bin.zip』 파일 다운로드
	
   	---------------------------------------------------------------------------------------
  
   	※ 의존관계 필수 라이브러리(commons-lang-2.6.jar)
   	1. 『http://json-lib.sourceforge.net』 요청 및 접근
   	2. 페이지 하단의 『Dependencies report』 클릭
   	   → 『https://json-lib.sourceforge.net/dependencies.html』
   	3. 페이지 중간의『Dependency Tree』 항목으로 이동하여
   	   『commons-lang:commons-lang:jar』 항목 클릭
   	   → 페이지 내의 특정 위치로 이동
   	4. 페이지 상단의 『http://commons.apache.org/lang/』항목 클릭
   	   → https://commons.apache.org/proper/commons-lang/
    5. 페이지 왼편의 『Download』클릭 
       → https://commons.apache.org/proper/commons-lang/download_lang.cgi
    6. 페이지 중간의 『commons-lang3-3.12.0-bin.zip』 클릭
       → 『commons-lang3-3.12.0-bin.zip』 파일 다운로드
   	
   	---------------------------------------------------------------------------------------
     
   	※ 의존관계 필수 라이브러리()
   	1. 『http://json-lib.sourceforge.net』 요청 및 접근
   	2. 페이지 하단의 『Dependencies report』 클릭
   	   → 『https://json-lib.sourceforge.net/dependencies.html』
   	3. 페이지 중간의『Dependency Tree』 항목으로 이동하여
   	   『net.sf.ezmorph:ezmorph:jar』 항목 클릭
   	   → 페이지 내의 특정 위치로 이동
   	4. 페이지 상단의 『http://ezmorph.sourceforge.net』항목 클릭
   	   → https://ezmorph.sourceforge.net/
    5. 페이지 왼편의 『Download』클릭 
       → https://sourceforge.net/projects/ezmorph/files/
    6. 페이지 중앙의 『Download Latest Version - ezmorph-1.0.6.jar (86.5 kB)』 클릭
       → 『ezmorph-1.0.6.jar』 파일 다운로드
	*/

	
%>
