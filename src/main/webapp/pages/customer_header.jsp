<%@page import="com.fssa.sharpandclean.model.User"%>

<link rel="stylesheet" href="../Assets/CSS/universe.css" />
<header class="header" id="header">


	<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	%>
	<%
	if (loggedInEmail == null) {
	%>
	<div class="header">
		<div>
			<a href="index.jsp"> <img class="logo_img"
				src="../Assets/Images/sharp logo black.png" alt="logo" />
			</a>
		</div>
		<div>
			<nav class="All-navs">
				<div class="nav_dropdown">
					<button class="nav_dropbtn">Hair styles</button>
					<div class="nav_dropdown-content">
						<a href="haircut_style.jsp">Haircut</a> 
							<a href="hair_straightening.jsp">Hair Straightening</a> 
								<a href="hair_coloring.jsp">Hair Coloring</a> 
							<a href="beard_style.jsp">Beard Trim</a>
					</div>
				</div>
				<div class="nav_dropdown">
					<button class="nav_dropbtn">Login</button>
					<div class="nav_dropdown-content">
						<a href="customer_login.jsp">Customer</a> <a
							href="barber_login.jsp">Barber</a>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<%
	} else {
	%>

	<div class="header">
		<div>
			<a href="customer_home.jsp"> <img class="logo_img"
				src="../Assets/Images/sharp logo black.png" alt="logo" />
			</a>
		</div>
		<div>
			<nav class="All-navs">
				<div class="nav_dropdown">
					<button class="nav_dropbtn">Hair styles</button>
					<div class="nav_dropdown-content">
						<a href="cus_haircut.jsp">Haircut</a> <a
							href="cus_hair_straightening.jsp">Hair Straightening</a> <a
							href="cus_hair_coloring.jsp">Hair Coloring</a> <a
							href="cus_beard_style.jsp">Beard Trim</a>
					</div>
				</div>
				<a class="nav" href="customer_book_now.jsp">Book Appointment</a> <a
					class="nav" href="GetBookingByUserEmailServlet">My Bookings</a> <a
					class="nav" href="GetUserByEmailServlet"><img
					src="../Assets/Images/profile-2.png" alt="profile" height="30px"
					width="30px" /></a>
			</nav>
		</div>
	</div>

	<%
	}
	%>
</header>