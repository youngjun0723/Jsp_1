<%@ page import="ch09.TeamBean" %>
<%@ page import="ch09.TeamMgr" %>
<%@ page import="ch09.MUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 11.
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 수정 후에 teamRead.jsp 리턴
    TeamMgr mgr = new TeamMgr();
    TeamBean bean = new TeamBean();

    String name = request.getParameter("name");
    String city = request.getParameter("city");
    int age = MUtil.parseInt(request, "age");
    String team = request.getParameter("team");

    bean.setName(name);
    bean.setCity(city);
    bean.setAge(age);
    bean.setTeam(team);
    //DB저장
    mgr.insertTeam(bean);
    //단순하게 응답을 teamRead.jsp
    response.sendRedirect("teamRead.jsp");
%>
