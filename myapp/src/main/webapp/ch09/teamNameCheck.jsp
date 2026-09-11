<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    boolean isDup = false;
    boolean hasName = (name != null && !name.trim().isEmpty());
    if (hasName) {
        name = name.trim();
        try {
            // 1. TeamMgr.checkName(name) 호출
            isDup = mgr.checkName(name);
        } catch (NoSuchMethodError e) {
            // 2. 톰캣 메모리에 구버전 TeamMgr 클래스가 캐싱된 경우 안전한 fallback 처리
            ch09.DBConnectionMgr pool = ch09.DBConnectionMgr.getInstance();
            java.sql.Connection con = null;
            java.sql.PreparedStatement pstmt = null;
            java.sql.ResultSet rs = null;
            try {
                con = pool.getConnection();
                pstmt = con.prepareStatement("select name from tblTeam where name = ?");
                pstmt.setString(1, name);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    isDup = true;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                pool.freeConnection(con, pstmt, rs);
            }
        }
    }

    // AJAX 호출인 경우 JSON 응답
    String ajax = request.getParameter("ajax");
    if ("true".equalsIgnoreCase(ajax)) {
        response.setContentType("application/json;charset=UTF-8");
        out.print("{\"duplicate\": " + isDup + ", \"name\": \"" + (hasName ? name : "") + "\"}");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이름 중복 확인</title>
<%@ include file="themeHead.jsp" %>
<script>
    function useName(val) {
        if (opener && !opener.closed && opener.document.frm) {
            opener.document.frm.name.value = val;
            if (typeof opener.setNameChecked === "function") {
                opener.setNameChecked(val);
            }
        }
        window.close();
    }
</script>
</head>
<body class="min-h-screen bg-slate-50 p-6 text-slate-800 dark:bg-slate-900 dark:text-slate-100 flex items-center justify-center">
<div class="w-full max-w-sm rounded-2xl border border-slate-200 bg-white p-6 shadow-md dark:border-slate-700 dark:bg-slate-800">
    <div class="flex items-center justify-between pb-3 border-b border-slate-100 dark:border-slate-700">
        <h2 class="text-base font-bold text-slate-900 dark:text-white">이름 중복 확인</h2>
        <span class="text-xs text-indigo-600 dark:text-indigo-400 font-medium">tblTeam</span>
    </div>

    <div class="mt-4">
        <% if (hasName) { %>
            <% if (isDup) { %>
                <div class="rounded-lg bg-rose-50 border border-rose-200 p-3 text-sm text-rose-700 dark:bg-rose-950/40 dark:border-rose-800 dark:text-rose-300">
                    <p class="font-semibold">중복된 이름입니다.</p>
                    <p class="mt-1 text-xs text-rose-600 dark:text-rose-400"><strong><%=name%></strong>은(는) 이미 등록되어 있습니다. 다른 이름을 입력하세요.</p>
                </div>
            <% } else { %>
                <div class="rounded-lg bg-emerald-50 border border-emerald-200 p-3 text-sm text-emerald-700 dark:bg-emerald-950/40 dark:border-emerald-800 dark:text-emerald-300">
                    <p class="font-semibold">사용 가능한 이름입니다!</p>
                    <p class="mt-1 text-xs text-emerald-600 dark:text-emerald-400"><strong><%=name%></strong>을(를) 팀원 이름으로 사용할 수 있습니다.</p>
                </div>
                <button type="button" onclick="useName('<%=name%>')"
                    class="mt-3 w-full rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-indigo-700">
                    이 이름 적용하기
                </button>
            <% } %>
        <% } else { %>
            <p class="text-xs text-slate-500 dark:text-slate-400">확인할 이름을 입력해 주세요.</p>
        <% } %>

        <form method="get" action="teamNameCheck.jsp" class="mt-4 flex gap-2">
            <input type="text" name="name" value="<%=hasName ? name : ""%>" placeholder="이름 입력"
                class="flex-1 rounded-lg border border-slate-300 bg-white px-3 py-1.5 text-sm outline-none transition focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:focus:border-indigo-400 dark:focus:ring-indigo-900">
            <button type="submit"
                class="rounded-lg bg-slate-800 px-3.5 py-1.5 text-xs font-semibold text-white transition hover:bg-slate-700 dark:bg-slate-700 dark:hover:bg-slate-600">
                검색
            </button>
        </form>
    </div>
</div>
<%@ include file="/common/theme.jsp" %>
</body>
</html>
