<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- isErrorPage = true를 해야만? exception이 뜬다!! -->
<%@ page isErrorPage="true" %>
<%
  //내장 객체: 8개 + 1개(exception)
  String msg = exception.getMessage();
%>
<h3>Error Message</h3>
다음과 같은 예외가 발생 하였습니다.
<%=msg%>
