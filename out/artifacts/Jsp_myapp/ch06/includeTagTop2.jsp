<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
%>
<hr color="red">
id: <%=id%> <br>
pwd: <%=pwd%> <br>
