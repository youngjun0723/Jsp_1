<%@ page pageEncoding="UTF-8" %>
<!-- ======================================================== -->
<!-- Global Theme Component (Dark / Light Mode Toggle)         -->
<!-- ======================================================== -->
<script>
	(function () {
		try {
			var savedTheme = localStorage.getItem("theme") || "light";
			if (savedTheme === "dark") {
				document.documentElement.classList.add("dark");
			} else {
				document.documentElement.classList.remove("dark");
			}
		} catch (e) {}
	})();
</script>

<style id="global-theme-styles">
	/* 1. 기본 화면 전환 애니메이션 */
	html {
		transition: background-color 0.25s ease, color 0.25s ease;
	}

	/* 2. 일반 JSP / HTML 페이지를 위한 범용 다크모드 스타일 */
	html.dark {
		color-scheme: dark;
	}

	html.dark body:not([class*="dark:"]) {
		background-color: #0f172a !important;
		color: #f1f5f9 !important;
	}

	/* 컨테이너, 카드, 박스류 */
	html.dark .container,
	html.dark .card,
	html.dark fieldset {
		background-color: #1e293b !important;
		color: #f1f5f9 !important;
		border-color: #334155 !important;
	}

	/* 텍스트 및 제목 */
	html.dark h1:not([class*="dark:"]),
	html.dark h2:not([class*="dark:"]),
	html.dark h3:not([class*="dark:"]),
	html.dark h4:not([class*="dark:"]) {
		color: #f8fafc !important;
	}

	/* 일반 HTML 테이블 (구구단 등) */
	html.dark table:not([class*="divide-"]):not([class*="dark:"]) {
		border-color: #334155 !important;
	}
	html.dark table:not([class*="divide-"]) caption {
		color: #f8fafc !important;
	}
	html.dark table:not([class*="divide-"]) th:not([class*="dark:"]) {
		background-color: #334155 !important;
		color: #f8fafc !important;
		border-color: #475569 !important;
	}
	html.dark table:not([class*="divide-"]) td:not([class*="dark:"]) {
		background-color: #1e293b !important;
		color: #cbd5e1 !important;
		border-color: #334155 !important;
	}
	html.dark table:not([class*="divide-"]) tr:hover td:not([class*="dark:"]) {
		background-color: #2c3e55 !important;
	}

	/* 폼 입력창 */
	html.dark input[type="text"],
	html.dark input[type="password"],
	html.dark input[type="number"],
	html.dark input[type="email"],
	html.dark input[type="search"],
	html.dark select,
	html.dark textarea {
		background-color: #1e293b !important;
		color: #f8fafc !important;
		border: 1px solid #475569 !important;
	}
	html.dark input::placeholder,
	html.dark textarea::placeholder {
		color: #64748b !important;
	}

	/* index.jsp 대시보드 전용 다크모드 대응 */
	html.dark .item {
		background: #1e293b !important;
		border-color: #334155 !important;
	}
	html.dark .item:hover {
		background: #24344d !important;
		border-color: #3b82f6 !important;
	}
	html.dark .item-title {
		color: #f8fafc !important;
	}
	html.dark .item-path {
		color: #94a3b8 !important;
	}
	html.dark .section-header {
		color: #cbd5e1 !important;
		border-bottom-color: #334155 !important;
	}
	html.dark .desc {
		color: #94a3b8 !important;
	}
	html.dark .empty-msg {
		background: #1e293b !important;
		color: #94a3b8 !important;
	}
	html.dark .footer {
		border-top-color: #334155 !important;
		color: #64748b !important;
	}

	/* 일반 링크 색상 보정 */
	html.dark a:not([class*="btn-"]):not([class*="bg-"]):not([class*="text-"]) {
		color: #60a5fa !important;
	}

	/* ======================================================== */
	/* 우측 하단 플로팅 테마 전환 위젯 스타일                   */
	/* ======================================================== */
	#global-theme-widget {
		position: fixed;
		bottom: 20px;
		right: 20px;
		z-index: 999999;
		display: inline-flex;
		align-items: center;
		background: rgba(255, 255, 255, 0.88);
		border: 1px solid rgba(203, 213, 225, 0.85);
		border-radius: 9999px;
		padding: 3px;
		box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12), 0 2px 4px rgba(0, 0, 0, 0.05);
		backdrop-filter: blur(10px);
		-webkit-backdrop-filter: blur(10px);
		user-select: none;
		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Malgun Gothic", sans-serif;
	}

	html.dark #global-theme-widget {
		background: rgba(30, 41, 59, 0.88);
		border-color: rgba(71, 85, 105, 0.85);
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4), 0 2px 6px rgba(0, 0, 0, 0.25);
	}

	#global-theme-widget button {
		display: inline-flex;
		align-items: center;
		gap: 6px;
		padding: 6px 14px;
		border-radius: 9999px;
		border: none;
		outline: none;
		cursor: pointer;
		font-size: 12px;
		font-weight: 600;
		line-height: 1;
		color: #64748b;
		background: transparent;
		transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
	}

	#global-theme-widget button:hover {
		color: #1e293b;
		background: rgba(0, 0, 0, 0.05);
	}

	html.dark #global-theme-widget button {
		color: #94a3b8;
	}

	html.dark #global-theme-widget button:hover {
		color: #f1f5f9;
		background: rgba(255, 255, 255, 0.1);
	}

	#global-theme-widget button.active {
		background: #4f46e5;
		color: #ffffff !important;
		box-shadow: 0 2px 8px rgba(79, 70, 229, 0.35);
	}

	html.dark #global-theme-widget button.active {
		background: #6366f1;
		color: #ffffff !important;
		box-shadow: 0 2px 10px rgba(99, 102, 241, 0.5);
	}

	#global-theme-widget svg {
		width: 14px;
		height: 14px;
		display: inline-block;
		vertical-align: middle;
	}
</style>

<div id="global-theme-widget" aria-label="테마 설정">
	<button type="button" id="theme-light-btn" onclick="setTheme('light')" title="라이트 모드 적용">
		<svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
			<circle cx="12" cy="12" r="4"></circle>
			<path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"></path>
		</svg>
		<span>Light</span>
	</button>
	<button type="button" id="theme-dark-btn" onclick="setTheme('dark')" title="다크 모드 적용">
		<svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
			<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
		</svg>
		<span>Dark</span>
	</button>
</div>

<script>
	function setTheme(theme) {
		try {
			localStorage.setItem("theme", theme);
		} catch (e) {}
		if (theme === "dark") {
			document.documentElement.classList.add("dark");
		} else {
			document.documentElement.classList.remove("dark");
		}
		syncThemeButtons();
	}

	function syncThemeButtons() {
		var theme = "light";
		try {
			theme = localStorage.getItem("theme") || "light";
		} catch (e) {}

		var lightBtn = document.getElementById("theme-light-btn");
		var darkBtn = document.getElementById("theme-dark-btn");
		if (lightBtn && darkBtn) {
			if (theme === "dark") {
				lightBtn.classList.remove("active");
				darkBtn.classList.add("active");
			} else {
				lightBtn.classList.add("active");
				darkBtn.classList.remove("active");
			}
		}
	}

	syncThemeButtons();
</script>
