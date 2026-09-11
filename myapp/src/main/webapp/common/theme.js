// Global Theme Script
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

// Immediate execution to prevent flash
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
