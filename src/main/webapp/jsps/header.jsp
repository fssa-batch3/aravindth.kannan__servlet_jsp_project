<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/universe.css" />
</head>
<body>

<header>
		<div class="header">
			<div>
				<a href="./index.html"> <img class="logo_img"
					src="../images/sharp logo black.png" alt="logo" />
				</a>
			</div>
			<div>
				<nav class="All-navs">
					<div class="nav_dropdown">
						<button class="nav_dropbtn">Hair styles</button>
						<div class="nav_dropdown-content">
							<a href="./pages/medium_style.html">Haircut</a> <a
								href="./pages/fade_style.html">Hair straightening</a> <a
								href="./pages/long_style.html">Hair coloring</a> <a
								href="./pages/undercut_style.html">Facials</a> <a
								href="./pages/short_style.html">Shaves</a> <a
								href="./pages/beard_style.html">Beard trim</a>
						</div>
					</div>
					<a class="nav" href="./pages/services.html">services</a>
					<div class="nav_dropdown">
						<button class="nav_dropbtn">Login</button>
						<div class="nav_dropdown-content">
							<a href="login.jsp">Customer</a> <a
								href="./pages/barber_login.html">Barber</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</header>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">BookWebApp</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>

				<%
				String loggedInEmail = (String) session.getAttribute("loggedInEmail");
				if (loggedInEmail == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="#"><%=loggedInEmail%></a>

				</li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a>

				</li>

				<%
				}
				%>
			</ul>

		</div>
	</div>
</nav>

</body>
</html>