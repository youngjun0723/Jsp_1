<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- SimpleBean bean = new SimpleBean(); 랑 같은 의미 -->
<jsp:useBean id="bean" class="ch09.SimpleBean"/>

<%--<jsp:setProperty name="bean" property="msg"/>--%>
<%--<jsp:setProperty name="bean" property="cnt"/>--%>

<!-- * : private 모든 것 수용 -->
<jsp:setProperty name="bean" property="*"/>
<h3>SimpleBean2</h3>
msg: <jsp:getProperty name="bean" property="msg"/><br>
cnt: <jsp:getProperty name="bean" property="cnt"/><br>
