<!-- teamInsertProc.jsp -->
<%@page import="ch09.MUtil"%>
<%@page import="ch09.TeamBean"%>
<%@page import="ch09.TeamMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
      	TeamMgr mgr = new TeamMgr();
		TeamBean bean = new TeamBean();
		
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = MUtil.parseInt(request, "age");
		String team = request.getParameter("team");
		
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		if(mgr.checkName(name)){
%>
<script>
	alert("이미 사용중인 이름입니다.");
	history.back();
</script>
<%
			return;
		}
		//DB저장
		mgr.insertTeam(bean);
		//단순하게 응답을 teamList.jsp
		response.sendRedirect("teamList.jsp");
%>





