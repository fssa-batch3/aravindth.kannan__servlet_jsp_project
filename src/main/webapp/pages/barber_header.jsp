<%@page import="com.fssa.sharpandclean.model.Barber"%>

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
          <a href="../pages/barber_home.html">
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
                <a href="medium_style.jsp">Haircut</a>
                <a href="fade_style.jsp"
                  >Hair straightening</a
                >
                <a href="long_style.jsp">Hair coloring</a>
                <a href="undercut_style.jsp">Facials</a>
                <a href="short_style.jsp">Shaves</a>
                <a href="beard_style.jsp">Beard trim</a>
              </div>
            </div>
            
            <a class="nav" href="barber_shop_card.jsp">Register Salon </a>
            <a class="nav" href="GetBookingBySalonEmailServlet">booking List</a>
            <a class="nav" href="SalonProfileServlet">Salon profile</a>
            <a class="nav" href="BarberProfileServlet" ><img
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