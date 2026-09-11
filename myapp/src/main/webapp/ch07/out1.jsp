<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page buffer="5kb" %>
<%
    int totalBuffer = out.getBufferSize();
    int remainBuffer = out.getRemaining();
    int userBuffer = totalBuffer = remainBuffer;
    out.println("출력 버퍼의 크기: " + totalBuffer + "bytes<br>");
    out.println("남은 버퍼의 크기: " + remainBuffer + "bytes<br>");
    out.println("사용 버퍼의 크기: " + userBuffer + "bytes<br>");

    String sub[] = {"Java", "Jsp", "Flutter", "Spring"};
    /*for(int i = 0; i < sub.length; i++) {
        out.println(sub[i] + "<br>");
    }*/
%>
    <% for(String s : sub) { %>
        <%=s%> <br>
    <%} %>
<%@ include file="/common/theme.jsp" %>