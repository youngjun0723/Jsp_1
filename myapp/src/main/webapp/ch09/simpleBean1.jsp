<!-- simpleBean1.jsp -->
<%@page import="ch09.SimpleBean"%>
<%@page import="ch09.MUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%	
		//useBean
		SimpleBean bean = new SimpleBean();
		//setProperty
      	String msg = request.getParameter("msg");
		int cnt = MUtil.parseInt(request, "cnt");
		bean.setMsg(msg);
		bean.setCnt(cnt);
%>
<h3>SimpleBean1</h3>
msg: <%=bean.getMsg() %><br>
cnt: <%=bean.getCnt() %><br>
