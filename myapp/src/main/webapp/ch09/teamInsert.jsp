<!-- teamInsert.jsp -->
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%Vector<String> vlist = mgr.teamList();%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Team Mgr</title>
<script src="https://cdn.tailwindcss.com"></script>
<jsp:include page="themeHead.jsp"/>
<script type="text/javascript">
	let nameChecked = false;
	let checkedName = "";

	function resetNameCheck() {
		nameChecked = false;
		checkedName = "";
		const msg = document.getElementById("nameCheckMsg");
		if(msg) msg.textContent = "";
	}

	function checkName() {
		f = document.frm;
		const name = f.name.value.trim();
		const msg = document.getElementById("nameCheckMsg");
		if(name==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		fetch("teamCheckName.jsp?name=" + encodeURIComponent(name))
			.then(function(res){ return res.text(); })
			.then(function(text){
				const result = text.trim();
				if(result==="ok"){
					nameChecked = true;
					checkedName = name;
					alert("사용 가능한 이름입니다.");
					if(msg){
						msg.textContent = "사용 가능한 이름입니다.";
						msg.className = "mt-1 text-xs text-emerald-600 dark:text-emerald-400";
					}
				}else if(result==="duplicate"){
					nameChecked = false;
					checkedName = "";
					alert("이미 사용중인 이름입니다.");
					if(msg){
						msg.textContent = "이미 사용중인 이름입니다.";
						msg.className = "mt-1 text-xs text-rose-600 dark:text-rose-400";
					}
					f.name.focus();
				}else{
					alert("이름을 입력하세요");
					f.name.focus();
				}
			})
			.catch(function(){
				alert("중복 확인 중 오류가 발생했습니다.");
			});
	}

	function validateForm() {
		f = document.frm;
		if(f.name.value==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if(!nameChecked || checkedName !== f.name.value.trim()){
			alert("이름 중복 확인을 해주세요");
			f.name.focus();
			return false;
		}
		if(f.city.value==""){
			alert("사는곳을 입력하세요");
			f.city.focus();
			return false;
		}
		if(f.age.value==""){
			alert("나이를 입력하세요");
			f.age.focus();
			return false;
		}
		if(f.team.value==""){
			alert("팀을 입력하세요");
			f.team.focus();
			return false;
		}
		return true;
	}

	function check() {
		if(!validateForm()) return;
		f = document.frm;
		f.action = "teamInsertProc.jsp";
		f.submit();
	}
	
	function check2() {
		if(!validateForm()) return;
		document.frm.action = "teamInsertProc2.jsp";
		document.frm.submit();
	}
	
	function selectTeam(team) {
		document.frm.team.value=team;
	}
</script>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-white to-indigo-50 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-lg px-4 py-10">
	<header class="mb-8">
		<p class="text-sm font-medium uppercase tracking-wider text-indigo-500 dark:text-indigo-400">Team Manager</p>
		<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team Insert</h1>
		<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">새 팀원 정보를 등록합니다.</p>
	</header>

	<form name="frm" method="post" action="teamInsertProc.jsp"
		class="rounded-2xl bg-white p-6 shadow-lg ring-1 ring-slate-200 dark:bg-slate-800 dark:ring-slate-700">
		<div class="space-y-4">
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">이름</label>
				<div class="flex gap-2">
					<input name="name" value="홍길동" oninput="resetNameCheck()"
						class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
					<input type="button" value="중복확인" onclick="checkName()"
						class="shrink-0 cursor-pointer rounded-lg border border-indigo-200 bg-indigo-50 px-3 py-2 text-sm font-semibold text-indigo-700 hover:bg-indigo-100 dark:border-indigo-700 dark:bg-indigo-950 dark:text-indigo-200 dark:hover:bg-indigo-900">
				</div>
				<p id="nameCheckMsg" class="mt-1 text-xs"></p>
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">사는곳</label>
				<input name="city" value="부산"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">나이</label>
				<input name="age" value="27"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100">
			</div>
			<div>
				<label class="mb-1 block text-sm font-semibold text-slate-600 dark:text-slate-300">팀명</label>
				<div class="flex flex-col gap-2 sm:flex-row">
					<input name="team" value="산적"
						class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 sm:flex-1">
					<select onchange="selectTeam(this.value)"
						class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm outline-none ring-indigo-500 focus:border-indigo-500 focus:ring-2 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 sm:w-48">
						<option value="">팀을 선택하세요</option>
						<%for(String team: vlist){ %>
						<option value="<%=team%>"><%=team%></option>
						<%} %>
					</select>
				</div>
			</div>
		</div>
		<div class="mt-6 flex gap-3">
			<input type="button" value="SAVE" onclick="check()"
				class="flex-1 cursor-pointer rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500">
			<input type="button" value="SAVE2" onclick="check2()"
				class="flex-1 cursor-pointer rounded-lg border border-indigo-200 bg-indigo-50 px-4 py-2.5 text-sm font-semibold text-indigo-700 hover:bg-indigo-100 dark:border-indigo-700 dark:bg-indigo-950 dark:text-indigo-200 dark:hover:bg-indigo-900">
		</div>
	</form>

	<p class="mt-6 text-center">
		<a href="teamList.jsp" class="text-sm font-semibold text-indigo-600 hover:underline dark:text-indigo-400">LIST</a>
	</p>
</div>
<jsp:include page="themeToggle.jsp"/>
</body>
</html>
