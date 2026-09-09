<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
  //세션: 서버에 Client의 정보를 저장하는 객체(단위)
  String sessionId = session.getId();
%>
세션ID: <%=sessionId%>