<!-- teamList.jsp -->
<%@page import="ch09.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<% Vector<TeamBean> vlist = mgr.listTeam();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h1>Team List</h1>
<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>사는곳</th>
			<th>나이</th>
			<th>팀명</th>
			<th>이동</th>
	</tr>
	<%
		for(int i = 0; i < vlist.size(); i++) {
			TeamBean bean = vlist.get(i);
			int num = bean.getNum();
	%>
	<tr align="center">
		<td><a href="teamRead.jsp?num=<%=num%>"><%=i+1%></a></td>
		<td><%=bean.getName()%></td>
		<td><%=bean.getCity()%></td>
		<td><%=bean.getAge()%></td>
		<td><%=bean.getTeam()%></td>
		<td><button onclick="location.href='teamRead.jsp?num=<%=num%>'">이동</button></td>
	</tr>
	<%}%>

</table><p>
<a href="teamInsert.jsp">INSERT</a>
</div>
</body>
</html>




