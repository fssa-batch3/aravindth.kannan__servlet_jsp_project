<%@ page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.sharpandclean.model.SalonBook"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/customer_booked_history.css" />
    <title>customer booked history</title>
  </head>
  <body>
  
      <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("customer_login.jsp");
	}
%>


   <jsp:include page="customer_header.jsp" />
    <!-- header finished -->

    <div class="both_list">
      <!-- shop booked list section is started -->
      <section class="shop_list">
        <h2>Salon booked list</h2>
         
         <%
         	List<SalonBook> salonBooks = (List<SalonBook>)request.getAttribute("bookList");
          System.out.println(salonBooks);
            if(salonBooks != null && !salonBooks.isEmpty()){	
         for(SalonBook salonbook : salonBooks){
         		
         	
         %>
         <div class="booked_div">
            <h2>Booked Details</h2>
            <p class="shop_text" id="shop_name"> Salon name : <%= salonbook.getSalonName() %></p>
            <ul>
              <li class="detail" id="customer_name">Booked OTP : <%= salonbook.getSalonOTP() %></li>
              <li class="detail" id="date">Booked date : <%= salonbook.getBookDate() %></li>
              <li class="detail" id="time">Booked time : <%= salonbook.getBookTime() %></li>
              <li class="detail" id="hairstyle">Booked Service : <%= salonbook.getBookService() %></li>
              <li class="detail" id="cus_phone">Salon phone : <%= salonbook.getSalonPhone() %></li>
              <li class="detail" id="cus_phone">Salon Area : <%= salonbook.getSalonArea() %></li>
              <li class="detail" id="cus_phone">About salon : <%= salonbook.getSalonAbout() %></li>
              <li class="detail" id="cus_phone">Salon Experience : <%= salonbook.getSalonEx() %></li>
              <li class="detail" id="cus_phone">Salon Address : <%= salonbook.getSalonAddress() %></li>
            </ul>
           <!--   <button id="done_button" class="done_btn">Remove</button> -->
          </div> 
          <%
         	}
         }else{
          %>
          <p>No Booked history available</p>
          <%
         }
          %>
      </section>
      <!--  barber booked list section is started -->
      <section class="barber_list">
        <h2>Barber booked list</h2>
      </section>
    </div>

    <!-- footer started -->
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

    
  </body>
</html>
