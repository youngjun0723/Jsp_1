<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // includeTag1.html에서 요청된 request정보. 같이 요청됨.
  String name = request.getParameter("name");
%>
include 액션태그의 Top입니다.<p>
<b><%=name%></b>파이팅!!
<hr color="red" width="40%" align="left">