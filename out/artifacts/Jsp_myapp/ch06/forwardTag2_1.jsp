<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bloodType = request.getParameter("bloodType");
    String name = "홍길동";
%>
<jsp:forward page='<%=bloodType+".jsp"%>'>
    <jsp:param name="name" value="<%=name%>"/>
</jsp:forward>
