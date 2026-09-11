<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String season = request.getParameter("season");
    String fruit = request.getParameter("fruit");

    // 세션에 저장된 id값 리턴
    String id = (String) session.getAttribute("idKey");
    int intelValTime = session.getMaxInactiveInterval();
    if(id!=null) {
%>

        <b><%=id%><b>님 좋아하는 계절과 과일은<br>
        <b><%=season%>과<b><%=fruit%></b>입니다.<br>
            세션ID: <%=season%>
            세션유지시간: <%=intelValTime%>초
<%} else {%>
    세션의 시간이 경과됐거나, 다른 이유로 연결을 지속할 수 없습니다.<br>
    <a href="session1.html">입력폼</a>
<%}%>
<%@ include file="/common/theme.jsp" %>