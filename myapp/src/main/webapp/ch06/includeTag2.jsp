<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String siteName = request.getParameter("siteName");
%>
요청한 사이트명: <%=siteName%>
<!-- param: 요청한 페이지로 동적으로 필요한 값이 필요할 때 -->
<jsp:include page="includeTagTop2.jsp">
  <jsp:param name="id" value="aaa"/>
  <jsp:param name="pwd" value="1234"/>
</jsp:include>