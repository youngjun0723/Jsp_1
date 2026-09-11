<!-- teamUpdate.jsp -->
<%@page import="ch09.TeamBean"%>
<%@page import="ch09.MUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%
		int num = 0;
		TeamBean bean = null;
		if(request.getParameter("num")==null){
			//num값이 정상적으로 남어오지 않을때
			response.sendRedirect("teamList.jsp");
			return;
		}else if(!MUtil.isNumeric(request.getParameter("num"))){
			//숫자의 형태의 num이 아닐때
			response.sendRedirect("teamList.jsp");
			return;
		}else{
			num = MUtil.parseInt(request, "num");
			bean = mgr.getTeam(num);
		}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Team Mgr</title>
<script src="https://cdn.tailwindcss.com"></script>
<jsp:include page="themeHead.jsp"/>
<script type="text/javascript">

</script>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-white to-indigo-50 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-lg px-4 py-10">
	<header class="mb-8">
		<p class="text-sm font-medium uppercase tracking-wider text-indigo-500 dark:text-indigo-400">Team Manager</p>
		<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team Update</h1>
		<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">팀원 정보를 수정합니다.</p>
	</header>

	<form name="frm" method="post" action="teamUpdateProc.jsp"
		class="rounded-2xl bg-white p-6 shadow-lg ring-1 ring-slate-200 dark:bg-slate-800 dark:ring-slate-700">
		<div class="space-y-4">
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">번호</label>
				<input name="num" value="<%=bean.getNum() %>" readonly
					class="w-full cursor-not-allowed rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm text-slate-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-400">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">이름</label>
				<input name="name" value="<%=bean.getName() %>"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">사는곳</label>
				<input name="city" value="<%=bean.getCity() %>"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">나이</label>
				<input name="age" value="<%=bean.getAge() %>"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">팀명</label>
				<input name="team" value="<%=bean.getTeam() %>"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
		</div>
		<div class="mt-6">
			<input type="submit" value="UPDATE"
				class="w-full cursor-pointer rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500">
		</div>
	</form>

	<p class="mt-6 text-center">
		<a href="teamRead.jsp?num=<%=num%>" class="text-sm font-semibold text-indigo-600 hover:underline dark:text-indigo-400">READ</a>
	</p>
</div>
<jsp:include page="themeToggle.jsp"/>
</body>
</html>
