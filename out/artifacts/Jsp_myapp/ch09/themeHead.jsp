<script>
	(function () {
		try {
			if (localStorage.getItem("theme") === "dark") {
				document.documentElement.classList.add("dark");
			}
		} catch (e) {}
	})();
</script>
<script>
	tailwind.config = { darkMode: "class" };
</script>
<script src="https://cdn.tailwindcss.com"></script>
