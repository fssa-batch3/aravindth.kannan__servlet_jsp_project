<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page import="com.fssa.sharpandclean.model.Salon"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/customer_select_shop.css" />
    <title>customer select shop</title>
  </head>
  <body>
    <!-- header is started -->
    <jsp:include page="customer_header.jsp" />
    <!-- header is ended -->

     <!-- search bar  start-->
     <div class="search_bar_div">
      <input placeholder="Search here.." type="text" class="search_bar" id="search_bar_id"/>
    </div>
     <!-- search bar end-->

    <!-- section is started -->
    <p class="big-font">Select your Salon</p>
    <div class="all-content">
    
    <!-- All salon cards are here -->
     <%
      List<Salon> salonlist = (List<Salon>) request.getAttribute("salonList");
                if(salonlist != null && !salonlist.isEmpty()){
      for(Salon salon1 : salonlist) {
    	  
      %>
    
    <div class="card">
          <div class="profile-card">
            <img
              id="card_profile"
              alt="shop image"
              class="img-responsive"
              src="<%= salon1.getSalonURL() %>"
            />
            <div class="name_div">
              <h2 id="card_b_name" class="hvr-underline-from-center">
               <%= salon1.getSalonName() %>
              </h2>
            </div>

            <div class="sample_text_div">
              <h2 class="hvr-underline-from-center">Sample haircuts</h2>
            </div>
            <div class="profile-info">
              <img
                id="card_sample_1"
                alt="haircutname"
                class="profile-pic"
                src="<%= salon1.getSalonSample1() %>"
              />

              <img
                id="card_sample_2"
                alt="haircutname"
                class="profile-pic"
                src="<%= salon1.getSalonSample2() %>"
              />

              <img
                id="card_sample_3"
                alt="haircutname"
                class="profile-pic"
                src="<%= salon1.getSalonSample3() %>"  />
            </div>

            <div class="two_btn_div">
              <a class="select_btn" href="shop_detail_page.jsp?salonId=<%=salon1.getSalonId()%>">Details</a>
              <a href="customer_shop_booking_form.jsp?salonId=<%=salon1.getSalonId() %>" class="select_btn">Select</a>
            </div>
          </div>
        </div>
        <%
        }
        } else {
    	 %>
    	 <p>No salons available</p>
    	 <%
     }
    	 %>
     
       
      <!-- all cards assemble here -->
    </div>
    <!-- section is ended -->

    <!-- footer is started -->
    <footer>
      <div class="footer">
        
          <div class="footicons">
            <a href="#"
              ><img
                class="footround"
                src="../Assets/Images/Y- facebook.png"
                alt="What's app"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../Assets/Images/Y- insta.png"
                alt="face book"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../Assets/Images/Y- twitter.png"
                alt="instagram"
            /></a>
           
          </div>
          <br>
          <div class="footer_firsthalf">
            <a>Home</a>
            <a>Services</a>
            <a>About</a>
            <a>terms</a>
            <a>Privacy policy</a>
        </div>
        <div class="copy_right_div">
          <pre>sharp & clean  <img alt="copy right" class="c_round" src="../Assets/Images/C - copyright.png"/>  2023</pre>
        </div>
      </div>
    </footer>
    <!-- footer is ended -->

    <!-- java script -->

  <script src="../Assets/JS/search_br.js"></script>
  </body>
</html>
