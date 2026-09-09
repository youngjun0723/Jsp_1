<%@ page contentType="text/html; charset=UTF-8"%>
<%
    //주석1
    /*주석2*/
%>
<!--선언문(Declaration) -->
<%! // 선언문은 %!
    //필드선언
    String dec = "선언문 변수";
    //메소드 선언
    public String decMethod(){
        return dec;
    }
%>
<!--스크립트릿(Scriptlet)-->
<% // 스크립트릿은 그냥 %
    String scriptlet = "스크립트릿";
    out.println("내장 객체를 이용한 출력: " + dec + "<br>");

    String comment = "Comment";
%>

<!-- 표션식 (Expression): 자바코드지만 ; 없음-->
선언문1: <%=dec%><br>
선언문2: <%=decMethod()%><br>
선언문3: <%=scriptlet%><br>

