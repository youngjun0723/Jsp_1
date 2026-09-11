<!-- teamInsert.html -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<% Vector<String> vlist = mgr.teamList();%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team Mgr</title>
<%@ include file="themeHead.jsp" %>
<script type="text/javascript">
	var isNameChecked = false;
	var checkedName = "";

	function checkName() {
		var f = document.frm;
		var nameVal = f.name.value.trim();
		var msgEl = document.getElementById("nameCheckMsg");

		if (nameVal === "") {
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}

		fetch("teamNameCheck.jsp?name=" + encodeURIComponent(nameVal) + "&ajax=true")
			.then(function(res) { return res.json(); })
			.then(function(data) {
				msgEl.classList.remove("hidden");
				if (data.duplicate) {
					isNameChecked = false;
					checkedName = "";
					msgEl.className = "mt-1.5 text-xs font-medium text-rose-500 dark:text-rose-400";
					msgEl.innerText = "✕ '" + nameVal + "'은(는) 이미 등록된 이름입니다. 다른 이름을 입력하세요.";
					f.name.focus();
				} else {
					isNameChecked = true;
					checkedName = nameVal;
					msgEl.className = "mt-1.5 text-xs font-medium text-emerald-600 dark:text-emerald-400";
					msgEl.innerText = "✓ '" + nameVal + "'은(는) 사용 가능한 이름입니다.";
				}
			})
			.catch(function(err) {
				console.error(err);
				checkNamePopup();
			});
	}

	function checkNamePopup() {
		var nameVal = document.frm.name.value.trim();
		if (nameVal === "") {
			alert("이름을 입력하세요");
			document.frm.name.focus();
			return;
		}
		window.open("teamNameCheck.jsp?name=" + encodeURIComponent(nameVal), "nameCheck", "width=420,height=340,top=200,left=300");
	}

	function setNameChecked(val) {
		isNameChecked = true;
		checkedName = val;
		var msgEl = document.getElementById("nameCheckMsg");
		if (msgEl) {
			msgEl.classList.remove("hidden");
			msgEl.className = "mt-1.5 text-xs font-medium text-emerald-600 dark:text-emerald-400";
			msgEl.innerText = "✓ '" + val + "'은(는) 사용 가능한 이름입니다.";
		}
	}

	function onNameInput() {
		var currentVal = document.frm.name.value.trim();
		if (currentVal !== checkedName) {
			isNameChecked = false;
			var msgEl = document.getElementById("nameCheckMsg");
			if (msgEl) {
				msgEl.classList.add("hidden");
			}
		}
	}

	function check() {
		f = document.frm;
		if(f.name.value.trim()==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if (!isNameChecked || f.name.value.trim() !== checkedName) {
			alert("이름 중복 확인을 해주세요.");
			f.name.focus();
			return;
		}
		if(f.city.value==""){
			alert("사는곳을 입력하세요");
			f.city.focus();
			return;
		}
		if(f.age.value==""){
			alert("나이를 입력하세요");
			f.age.focus();
			return;
		}
		if(f.team.value==""){
			alert("팀을 입력하세요");
			f.team.focus();
			return;
		}
		f.submit();
	}

	function check2() {
		f = document.frm;
		if(f.name.value.trim()==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if (!isNameChecked || f.name.value.trim() !== checkedName) {
			alert("이름 중복 확인을 해주세요.");
			f.name.focus();
			return;
		}
		if(f.city.value==""){
			alert("사는곳을 입력하세요");
			f.city.focus();
			return;
		}
		if(f.age.value==""){
			alert("나이를 입력하세요");
			f.age.focus();
			return;
		}
		if(f.team.value==""){
			alert("팀을 입력하세요");
			f.team.focus();
			return;
		}
		document.frm.action = "teamInsertProc2.jsp";
		document.frm.submit();
	}

	function selectTeam(team) {
		document.frm.team.value=team;
	}
</script>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-50 via-indigo-50 to-slate-100 text-slate-800 dark:from-slate-950 dark:via-slate-900 dark:to-indigo-950 dark:text-slate-100">
<div class="mx-auto max-w-lg px-4 py-12">
	<header class="mb-8">
		<p class="text-sm font-medium tracking-wide text-indigo-600 dark:text-indigo-400">Chapter 09</p>
		<h1 class="mt-1 text-3xl font-bold tracking-tight text-slate-900 dark:text-white">Team Insert</h1>
		<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">새 팀원 정보를 입력하세요.</p>
	</header>

	<form name="frm" method="post" action="teamInsertProc.jsp"
		class="space-y-5 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-700 dark:bg-slate-800">
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">이름</label>
			<div class="flex flex-col gap-2 sm:flex-row">
				<input name="name" value="" placeholder="이름을 입력하세요" oninput="onNameInput()"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900 sm:flex-1">
				<button type="button" onclick="checkName()"
					class="whitespace-nowrap rounded-lg border border-indigo-600 bg-indigo-50 px-4 py-2 text-sm font-semibold text-indigo-700 shadow-sm transition hover:bg-indigo-100 dark:border-indigo-500 dark:bg-indigo-950/60 dark:text-indigo-300 dark:hover:bg-indigo-900/80 sm:w-28">
					중복확인
				</button>
			</div>
			<p id="nameCheckMsg" class="mt-1.5 text-xs font-medium hidden"></p>
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">사는곳</label>
			<input name="city" value="부산"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">나이</label>
			<input name="age" value="27"
				class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
		</div>
		<div>
			<label class="mb-1.5 block text-sm font-medium text-slate-700 dark:text-slate-200">팀명</label>
			<div class="flex flex-col gap-2 sm:flex-row">
				<input name="team" value="산적" size="5"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900 sm:flex-1">
				<select onchange="selectTeam(this.value)"
					class="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm shadow-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900 sm:w-48">
					<option value="">팀을 선택하세요</option>
					<% for(String team : vlist) { %>
					<option value="<%=team%>"><%=team%></option>
					<%}%>
				</select>
			</div>
		</div>
		<div class="flex flex-col gap-2 pt-2 sm:flex-row">
			<input type="button" value="SAVE" onclick="check()"
				class="flex-1 cursor-pointer rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-indigo-700">
			<input type="button" value="SAVE2" onclick="check2()"
				class="flex-1 cursor-pointer rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-sm font-semibold text-slate-700 shadow-sm transition hover:bg-slate-50 dark:border-slate-600 dark:bg-slate-700 dark:text-slate-200 dark:hover:bg-slate-600">
		</div>
	</form>

	<p class="mt-6">
		<a href="teamList.jsp" class="text-sm font-medium text-indigo-600 hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300">← LIST</a>
	</p>
</div>
<%@ include file="/common/theme.jsp" %>
</body>
</html>
