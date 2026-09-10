<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bloodType = request.getParameter("bloodType");
    String name = "기안84";
%>
<!-- 표현식에서 ""값이 필요하면 ''으로 시작 -->
<jsp:include page='<%=bloodType + ".jsp"%>'>
    <jsp:param name="name" value="<%=name%>"/>
</jsp:include>
<!-- .html -> AB -> .jsp 순서로 제어권을 가짐 그러고 다시 역순으로 넘어감-->