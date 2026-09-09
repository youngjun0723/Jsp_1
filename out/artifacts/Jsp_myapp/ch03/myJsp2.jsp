<%@ page contentType="text/html; charset=UTF-8"%>
    <%
        String str = "오늘은 뭐 먹지??????";
        //myJsp2.jsp를 실행하면 Tomcat 서버(JSP Container)에서 서브릿 코드로 변환 -> myJsp2_jsp.java
        //jp가 Servlet로 변환된 파일을 저장하는 위치를 지정하는 workDir
        //jsp는 개발자가 편하게 코딩하고 실행은 서블릿 형태로 변환
        out.print(application.getRealPath("/")+"<br>");
    %>
    MSG: <%=str%>