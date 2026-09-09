<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<!-- http://localhost/myapp/ch05/if.jsp?name=aaa&color=blue -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>If-else Example</h1>
<%!
  String msg;
%>
<%
  String name = request.getParameter("name"); // request는 내장객체. jsp page에서 자동적으로 제공.
  String color = request.getParameter("color");

  if(color.equals("blue")) {
    msg = "파란색";
  } else if (color.equals("red")) {
    msg = "빨간색";
  } else if (color.equals("orange")) {
    msg = "주황색";
  } else {
    color = "white";
    msg = "기타색";
  }
%>
<body bgcolor=<%=color%>>
<b><%=name%></b>님이 좋아하는 색은 <b><%=msg%></b>입니다.
</body>