<%@ page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.sharpandclean.model.SalonBook"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/barber_booking_list.css" />
    <title>barber booking list</title>
  </head>
  <body>
  
      <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("barber_login.jsp");
	}
%>
    <!-- header is started -->
    <jsp:include page="barber_header.jsp" />
    <!-- header is ended -->

    <!-- both booked list -->
    <div class="both_list">
      <!-- shop booked list section is started -->
      <section class="shop_list">
      
        <h2>Salon booked list</h2>
        <%
         	List<SalonBook> salonBooked = (List<SalonBook>)request.getAttribute("salonBookList");
            if(salonBooked != null && !salonBooked.isEmpty()){	
         for(SalonBook salonBooks : salonBooked){
         		
         	
         %>
        
         <div class="booked_div">
          <h2>Booked Details</h2>
          <h1  id="shop_name">Customer Name : <%= salonBooks.getBookUserName() %></h1>
          <ul>
            <li class="detail" id="customer_name">Customer Phone : <%= salonBooks.getBookUserPhone() %></li>
            <li class="detail" id="date">Booked Service : <%= salonBooks.getBookService() %></li>
            <li class="detail" id="time">Booked Date : <%= salonBooks.getBookDate() %></li>
            <li class="detail" id="hairstyle">Booked Schedule: <%= salonBooks.getBookTime() %></li>
            <li class="detail" id="cus_phone">Booked OTP : <%= salonBooks.getSalonOTP() %></li>
          </ul>
          
        </div> 
        
        <%
         }
            }else {
        %>
        <p>No Salon booked history available</p>
        <%
            }
        %>
      </section>
      <!--  barber booked list section is started -->
      <section class="barber_list">
        <h2>Barber booked list</h2>
      </section>
    </div>

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
    
  </body>
</html>
