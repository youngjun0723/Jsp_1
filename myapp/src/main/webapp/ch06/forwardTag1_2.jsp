<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
%>
<!-- 이 페이지가 Client로 응답(response) -->
id: <%=id%> / pwd: <%=pwd%>