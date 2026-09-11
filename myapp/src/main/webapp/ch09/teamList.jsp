<!-- teamList.jsp -->
<%@page import="ch09.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%Vector<TeamBean> vlist = mgr.listTeam();%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Team Mgr</title>
<script src="https://cdn.tailwindcss.com"></script>
<jsp:include page="themeHead.jsp"/>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-white to-indigo-50 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-5xl px-4 py-10">
	<header class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
		<div>
			<p class="text-sm font-medium uppercase tracking-wider text-indigo-500 dark:text-indigo-400">Team Manager</p>
			<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team List</h1>
			<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">등록된 팀원 <%=vlist.size()%>명</p>
		</div>
		<a href="teamInsert.jsp"
			class="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500">
			INSERT
		</a>
	</header>

	<div class="overflow-hidden rounded-2xl bg-white shadow-lg ring-1 ring-slate-200 dark:bg-slate-800 dark:ring-slate-700">
		<div class="overflow-x-auto">
			<table class="min-w-full divide-y divide-slate-200 text-sm dark:divide-slate-700">
				<thead class="bg-slate-50 dark:bg-slate-900/60">
					<tr>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">번호</th>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">이름</th>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">사는곳</th>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">나이</th>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">팀명</th>
						<th class="px-4 py-3 text-center font-semibold text-slate-600 dark:text-slate-300">이동</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-slate-100 dark:divide-slate-700">
				<%
					if (vlist.isEmpty()) {
				%>
					<tr>
						<td colspan="6" class="px-4 py-10 text-center text-slate-400">등록된 팀원이 없습니다.</td>
					</tr>
				<%
					}
					for(int i=0;i<vlist.size();i++){
						TeamBean bean = vlist.get(i);
						int num = bean.getNum();
				%>
					<tr class="text-center hover:bg-indigo-50/60 dark:hover:bg-slate-700/60">
						<td class="px-4 py-3">
							<a href="teamRead.jsp?num=<%=num%>" class="font-medium text-indigo-600 hover:underline dark:text-indigo-400"><%=i+1%></a>
						</td>
						<td class="px-4 py-3 font-medium text-slate-900 dark:text-white"><%=bean.getName() %></td>
						<td class="px-4 py-3"><%=bean.getCity() %></td>
						<td class="px-4 py-3"><%=bean.getAge() %></td>
						<td class="px-4 py-3">
							<span class="inline-flex rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/70 dark:text-indigo-200"><%=bean.getTeam() %></span>
						</td>
						<td class="px-4 py-3">
							<button type="button"
								onclick="location.href='teamRead.jsp?num=<%=num%>'"
								class="rounded-md border border-slate-200 bg-white px-3 py-1.5 text-xs font-semibold text-slate-700 hover:border-indigo-300 hover:text-indigo-600 dark:border-slate-600 dark:bg-slate-800 dark:text-slate-200 dark:hover:border-indigo-400 dark:hover:text-indigo-300">
								이동
							</button>
						</td>
					</tr>
				<%}//--for %>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="themeToggle.jsp"/>
</body>
</html>
