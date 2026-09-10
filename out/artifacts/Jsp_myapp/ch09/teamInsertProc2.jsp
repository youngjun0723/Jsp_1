<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<jsp:useBean id="bean" class="ch09.TeamBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
    mgr.insertTeam(bean);
    response.sendRedirect("teamList.jsp");
%>
