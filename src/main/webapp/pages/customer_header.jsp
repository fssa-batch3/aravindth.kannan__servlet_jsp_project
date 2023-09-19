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
					src="../images/sharp logo black.png" alt="logo" />
				</a>
			</div>
			<div>
				<nav class="All-navs">
					<div class="nav_dropdown">
						<button class="nav_dropbtn">Hair styles</button>
						<div class="nav_dropdown-content">
							<a href="medium_style.jsp">Haircut</a> <a
								href="fade_style.jsp">Hair straightening</a> <a
								href="long_style.jsp">Hair coloring</a> <a
								href="undercut_style.jsp">Facials</a> <a
								href="short_style.jsp">Shaves</a> <a
								href="beard_style.jsp">Beard trim</a>
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
          <a href="customer_home.jsp">
            <img
              class="logo_img"
              src="../Assets/Images/sharp logo black.png"
              alt="logo"
            />
          </a>
        </div>
        <div>
          <nav class="All-navs">
            <div class="nav_dropdown">
              <button class="nav_dropbtn">Hair styles</button>
              <div class="nav_dropdown-content">
                <a href="customer_medium_style.jsp">Haircut</a>
                <a href="customer_fade_style.jsp">Hair straightening</a>
                <a href="customer_long_style.jsp">Hair coloring</a>
                <a href="customer_undercut_style.jsp">Facials</a>
                <a href="customer_short_style.jsp">Shaves</a>
                <a href="customer_beard_style.jsp">Beard trim</a>
              </div>
            </div>
            <a class="nav" href="customer_book_now.jsp">book now</a>
            <a class="nav" href="customer_booked_history.jsp">Booked history</a>
            <a class="nav" href="GetUserByEmailServlet"
              ><img
                src="../Assets/Images/profile-2.png"
                alt="profile"
                height="30px"
                width="30px"
            /></a>
          </nav>
        </div>
      </div>

<%
}
%>
</header>