<!-- simpleBean2.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bean" class="ch09.SimpleBean"/>
<!-- *: private 모든것 수용 -->
<jsp:setProperty property="*" name="bean"/>
<h3>SimpleBean2</h3>
msg: <jsp:getProperty property="msg" name="bean"/><br>
cnt: <jsp:getProperty property="cnt" name="bean"/><br>
