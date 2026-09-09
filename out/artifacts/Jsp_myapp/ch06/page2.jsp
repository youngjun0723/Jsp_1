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
  // 사이트 처음 접속 시 부여되는 ID값. 16진수 형태의 32자
  String sessionId = session.getId();
  session.setMaxInactiveInterval(30); // 기본값은 30min. 지금은 30sec
%>
세션ID: <%=sessionId%>