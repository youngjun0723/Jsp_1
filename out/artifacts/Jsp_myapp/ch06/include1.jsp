<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- include 지시자는 여러 개의 파일이 합쳐서 하나의 자바파일(서블릿)으로 변환되는 기능이 있음. -->
<%@ include file="top.jsp"%>
include 지시자의 body입니다.
top.jsp에서 선언한 변수 str: <%=str%>

<%@ include file="bottom.jsp"%>