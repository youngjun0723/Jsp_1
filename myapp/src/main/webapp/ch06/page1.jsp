<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date"%>
<%@ page import="java.net.*, java.util.Vector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- pageEncoding: JSP 페이지 코드 인코딩. 만약 선언하지 않으면 charset이 역할을 대신한다. -->
<!--  근데 결국 charset이 대신할 수 있기 때문에 작성 안해도 됨 -->
<%@ page pageEncoding="utf-8" %>
<%
    Date d = new Date();
%>
현재의 날짜와 시간은? <%=d.toLocaleString()%>