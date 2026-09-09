<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String name = request.getParameter("name");
%>
<!-- include 액션태그는 request 정보까지 제어권이 넘어갈 때 전달 -->
<jsp:include page="includeTagTop1.jsp"/>
include 액션태그의 body입니다.