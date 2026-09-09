<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 9.
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 잘 안쓴다 그냥 그러려니하고 넘어가면 된다 -->
<%@ page isELIgnored="false" %>
<%
    String site = "JSPStudy.co.kr";
    request.setAttribute("site", site);
%>
사이트명: ${site}