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
					src="../Assets/Images/sharp logo black.png" alt="logo" />
				</a>
			</div>
			<div>
				<nav class="All-navs">
				 	<div class="nav_dropdown">
						<button class="nav_dropbtn">Hair Styles</button>
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
              <button class="nav_dropbtn">Hair Styles</button>
              <div class="nav_dropdown-content">
                <a href="barber_haircut.jsp">Haircut</a>
                <a href="barber_hair_straightening.jsp">Hair Straightening</a>
                <a href="barber_hair_coloring.jsp">Hair Coloring</a>
                <a href="barber_beard.jsp">Beard Trim</a>
              </div>
            </div> 
            
            <a class="nav" href="barber_shop_card.jsp">Register Salon </a>
            <a class="nav" href="GetBookingBySalonEmailServlet">Booking List</a>
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