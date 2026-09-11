<!-- teamRead.jsp -->
<%@page import="ch09.TeamBean"%>
<%@page import="ch09.MUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%
	int num = 0;
	TeamBean bean = null;
	if(request.getParameter("num")==null) {
		// num값이 정상적으로 넘어오지 않을 때
		response.sendRedirect("teamList.jsp");
		return;
	} else if(!MUtil.isNumeric((request.getParameter("num")))) {
		//숫자의 형태의 num이 아닐 때
		response.sendRedirect("teamList.jsp");
		return;
	} else {
		num = MUtil.parseInt(request, "num");
		bean = mgr.getTeam(num);
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team Mgr</title>
<%@ include file="themeHead.jsp" %>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-indigo-50 to-slate-100 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-lg px-4 py-12">
	<header class="mb-8">
		<p class="text-sm font-medium tracking-wide text-indigo-600 dark:text-indigo-400">Chapter 09</p>
		<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team Read</h1>
		<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">선택한 팀원 상세 정보</p>
	</header>

	<div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm dark:border-slate-700 dark:bg-slate-800">
		<dl class="divide-y divide-slate-100 dark:divide-slate-700">
			<div class="grid grid-cols-3 px-5 py-3.5">
				<dt class="text-sm font-medium text-slate-500 dark:text-slate-400">번호</dt>
				<dd class="col-span-2 text-sm font-semibold text-slate-900 dark:text-white"><%=bean.getNum()%></dd>
			</div>
			<div class="grid grid-cols-3 px-5 py-3.5">
				<dt class="text-sm font-medium text-slate-500 dark:text-slate-400">이름</dt>
				<dd class="col-span-2 text-sm font-semibold text-slate-900 dark:text-white"><%=bean.getName()%></dd>
			</div>
			<div class="grid grid-cols-3 px-5 py-3.5">
				<dt class="text-sm font-medium text-slate-500 dark:text-slate-400">사는곳</dt>
				<dd class="col-span-2 text-sm text-slate-800 dark:text-slate-200"><%=bean.getCity()%></dd>
			</div>
			<div class="grid grid-cols-3 px-5 py-3.5">
				<dt class="text-sm font-medium text-slate-500 dark:text-slate-400">나이</dt>
				<dd class="col-span-2 text-sm text-slate-800 dark:text-slate-200"><%=bean.getAge()%></dd>
			</div>
			<div class="grid grid-cols-3 px-5 py-3.5">
				<dt class="text-sm font-medium text-slate-500 dark:text-slate-400">팀명</dt>
				<dd class="col-span-2">
					<span class="inline-flex rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/60 dark:text-indigo-200"><%=bean.getTeam()%></span>
				</dd>
			</div>
		</dl>
	</div>

	<nav class="mt-6 flex flex-wrap gap-2">
		<a href="teamList.jsp" class="rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-700 shadow-sm hover:bg-slate-50 dark:border-slate-600 dark:bg-slate-800 dark:text-slate-200 dark:hover:bg-slate-700">LIST</a>
		<a href="teamInsert.jsp" class="rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-700 shadow-sm hover:bg-slate-50 dark:border-slate-600 dark:bg-slate-800 dark:text-slate-200 dark:hover:bg-slate-700">INSERT</a>
		<a href="teamUpdate.jsp?num=<%=num%>" class="rounded-lg bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-700">UPDATE</a>
		<a href="teamDelete.jsp?num=<%=num%>" class="rounded-lg bg-rose-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-rose-700">DELETE</a>
		<a href="teamDelete?num=<%=num%>" class="rounded-lg border border-rose-200 bg-rose-50 px-3 py-2 text-sm font-medium text-rose-700 hover:bg-rose-100 dark:border-rose-800 dark:bg-rose-950 dark:text-rose-300 dark:hover:bg-rose-900">DELETE2</a>
	</nav>
</div>
<%@ include file="/common/theme.jsp" %>
</body>
</html>
