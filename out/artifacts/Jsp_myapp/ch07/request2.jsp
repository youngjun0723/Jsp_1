<%@ page import="ch07.MUtil" %><%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String protocol = request.getProtocol();
    int port = request.getServerPort(); //Default 80번
    //ip 주소값
    String remoteAddr = request.getRemoteAddr();
    String method = request.getMethod();
    String uri = request.getRequestURI();
    StringBuffer url = request.getRequestURL();
    String query = request.getQueryString();
    int age = Integer.parseInt(request.getParameter("age"));
    int age2 = MUtil.parseInt(request, "age");
%>
protocol: <%=protocol%><br>
port: <%=port%><br>
<!-- 0:0:0:0:0:0:0:1 : IPv6값 -> 127.0.0.1 : IPv4 -->
<!-- Run > Run Configurations > Tomcat 선택 VM arguments : -Djava.net.preferIPv4Stack=true -->
remoteAddr: <%=remoteAddr%><br>
method: <%=method%><br>
uri: <%=uri%><br>
url: <%=url%><br>
query: <%=query%><br>

<!-- action: 지정하지 않으면 현재 페이지 호출 -->
<form method="post">
    age: <input type="text" name="age" value="23">
    <input type="submit" value="SEND">
</form>