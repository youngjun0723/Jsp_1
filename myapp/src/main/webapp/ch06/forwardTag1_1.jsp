<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
%>
id: <%=id%><br>
pwd: <%=pwd%><br>
<!-- forward 화면이 보여지는 기능은 없고 Controll 역할을 한다 -->
<!-- include 액션태그와 동일하게 request(요청 바구니)도 같이 넘어감 -->
<jsp:forward page="forwardTag1_2.jsp"/>