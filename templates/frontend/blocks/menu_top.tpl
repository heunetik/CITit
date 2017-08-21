<div id="top_menu_button" class="menu_button" onclick="ShowTopMenu()">
	<span></span>
	<span></span>
	<span></span>
</div>
<ul id="top_menu" class="menu_top">
	<li class="{SEL_PAGE_HOME}{SEL_PAGE_ABOUT}{SEL_PAGE_WHO-WE-ARE}">
		<a class="menuStuff" href="{SITE_URL}">Home</a>
	</li>
	<!-- BEGIN top_menu_not_logged -->
	<li class="{SEL_USER_LOGIN}">
		<a class="menuStuff" href="{SITE_URL}/user/login">Log In</a>
	</li>
	<li class="{SEL_USER_REGISTER}">
		<a class="menuStuff" href="{SITE_URL}/user/register">Register</a>
	</li>
	<!-- END top_menu_not_logged -->
	<!-- BEGIN top_menu_logged -->
	<li class="{SEL_USER_ACCOUNT}">
		<a class="menuStuff" href="{SITE_URL}/user/account">Profile</a>
	</li>
	<li>
		<a class="menuStuff" href="{SITE_URL}/user/logout">Log Out</a>
	</li>
	<!-- END top_menu_logged -->
</ul>