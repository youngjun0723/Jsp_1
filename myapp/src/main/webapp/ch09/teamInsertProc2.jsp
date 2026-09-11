<!-- teamInsertProc2.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<jsp:useBean id="bean" class="ch09.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		if(mgr.checkName(bean.getName())){
%>
<script>
	alert("이미 사용중인 이름입니다.");
	history.back();
</script>
<%
			return;
		}
      	mgr.insertTeam(bean);
		response.sendRedirect("teamList.jsp");
%>





