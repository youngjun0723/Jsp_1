<!-- teamList.jsp -->
<%@page import="ch09.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<% Vector<TeamBean> vlist = mgr.listTeam();%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team Mgr</title>
<%@ include file="themeHead.jsp" %>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-indigo-50 to-slate-100 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-4xl px-4 py-12">
	<header class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
		<div>
			<p class="text-sm font-medium tracking-wide text-indigo-600 dark:text-indigo-400">Chapter 09</p>
			<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team List</h1>
			<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">등록된 팀원 <%=vlist.size()%>명</p>
		</div>
		<a href="teamInsert.jsp"
			class="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-indigo-700">
			팀원 등록
		</a>
	</header>

	<div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm dark:border-slate-700 dark:bg-slate-800">
		<table class="min-w-full divide-y divide-slate-200 text-sm dark:divide-slate-700">
			<thead class="bg-slate-800 text-left text-xs font-semibold uppercase tracking-wider text-slate-100 dark:bg-slate-950">
				<tr>
					<th class="px-4 py-3">번호</th>
					<th class="px-4 py-3">이름</th>
					<th class="px-4 py-3">사는곳</th>
					<th class="px-4 py-3">나이</th>
					<th class="px-4 py-3">팀명</th>
					<th class="px-4 py-3 text-center">상세</th>
				</tr>
			</thead>
			<tbody class="divide-y divide-slate-100 dark:divide-slate-700">
			<%
				if (vlist.isEmpty()) {
			%>
				<tr>
					<td colspan="6" class="px-4 py-12 text-center text-slate-400">등록된 팀원이 없습니다.</td>
				</tr>
			<%
				}
				for(int i = 0; i < vlist.size(); i++) {
					TeamBean bean = vlist.get(i);
					int num = bean.getNum();
			%>
				<tr class="transition hover:bg-indigo-50/60 dark:hover:bg-slate-700/60">
					<td class="px-4 py-3">
						<a href="teamRead.jsp?num=<%=num%>" class="font-medium text-indigo-600 hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300"><%=i+1%></a>
					</td>
					<td class="px-4 py-3 font-medium text-slate-900 dark:text-slate-100"><%=bean.getName()%></td>
					<td class="px-4 py-3 text-slate-600 dark:text-slate-300"><%=bean.getCity()%></td>
					<td class="px-4 py-3 text-slate-600 dark:text-slate-300"><%=bean.getAge()%></td>
					<td class="px-4 py-3">
						<span class="inline-flex rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/60 dark:text-indigo-200"><%=bean.getTeam()%></span>
					</td>
					<td class="px-4 py-3 text-center">
						<button type="button" onclick="location.href='teamRead.jsp?num=<%=num%>'"
							class="rounded-md border border-slate-200 bg-white px-3 py-1.5 text-xs font-medium text-slate-700 shadow-sm transition hover:border-indigo-300 hover:text-indigo-700 dark:border-slate-600 dark:bg-slate-700 dark:text-slate-200 dark:hover:border-indigo-400 dark:hover:text-indigo-300">
							상세
						</button>
					</td>
				</tr>
			<%}%>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="/common/theme.jsp" %>
</body>
</html>
