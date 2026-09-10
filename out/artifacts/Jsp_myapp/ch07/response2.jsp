<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 26. 9. 10.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //응답에 파일들을 Cache에 저장하지 않도록 세팅
    //반드시 서버의 요청에 의해서 만들어지는 페이지 ex) 로그인 관련 페이지
    // 로그인 관련, 실시간 데이터 표시, 보안과 관련 중요한 페이지
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);//캐쉬의 만료일을 0으로 세팅 -> 반드시 서버 요청
%>
response2.jsp