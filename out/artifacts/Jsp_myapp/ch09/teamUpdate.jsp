<!-- teamUpdate.jsp -->
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
		<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team Update</h1>
		<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">팀원 정보를 수정합니다.</p>
	</header>

	<form name="frm" method="post" action="teamUpdateProc.jsp"
		class="space-y-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-700 dark:bg-slate-800">
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">번호</label>
			<input name="num" value="<%=bean.getNum() %>" readonly
				class="w-full cursor-not-allowed rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm text-slate-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-400">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">이름</label>
			<input name="name" value="<%=bean.getName() %>"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">사는곳</label>
			<input name="city" value="<%=bean.getCity() %>"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">나이</label>
			<input name="age" value="<%=bean.getAge() %>"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">팀명</label>
			<input name="team" value="<%=bean.getTeam() %>"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<input type="submit" value="UPDATE"
			class="w-full cursor-pointer rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-indigo-700">
	</form>

	<p class="mt-6">
		<a href="teamRead.jsp?num=<%=num%>" class="text-sm font-medium text-indigo-600 hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300">← READ</a>
	</p>
</div>
<%@ include file="/common/theme.jsp" %>
</body>
</html>
