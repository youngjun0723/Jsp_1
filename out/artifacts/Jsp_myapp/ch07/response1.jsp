<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 지정한 페이지로 Client 응답. request 정보가 넘어 가지 않음
    // request정보가 넘어가야한다. forward
    // 그게 아닌, 단순한 전달이다 -> response..sendRedirect..
    response.sendRedirect("response2.jsp");
%>