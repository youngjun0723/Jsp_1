<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ch09.MUtil" %>
<%@ page import="ch09.SimpleBean" %>
<%
    // userBean
    SimpleBean bean = new SimpleBean();
    // setProperty
    String msg = request.getParameter("msg");
    int cnt = MUtil.parseInt(request, "cnt");
    bean.setMsg(msg);
    bean.setCnt(cnt);
%>
<h3>SimpleBean1</h3>
msg: <%=bean.getMsg()%><br>
cnt: <%=bean.getCnt()%><br>
<%@ include file="/common/theme.jsp" %>

