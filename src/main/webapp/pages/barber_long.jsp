<%@page import="com.fssa.sharpandclean.service.StyleService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.sharpandclean.model.Style"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>long</title>
    <link rel="stylesheet" href="../Assets/CSS/hair_style.css" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
  </head>
  <body>
  
    <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("barber_login.jsp");
	}
%>
    <jsp:include page="barber_header.jsp"/>

    <!-- search bar  start-->
    <div class="search_bar_div">
      <input placeholder="Search here.." type="text" class="search_bar" id="search_bar_id"/>
    </div>
     <!-- search bar end-->

    <div class="Short">
      <p class="short-1">Hair coloring</p>
    </div>
    <section>
      <div class="big-div">
        <div class="big-img">
          <img
            alt="image"
            src="../Assets/Images/long-0.jpeg"
            class="big-img-1"
          />
        </div>
        <div class="two-img">
          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../Assets/Images/long-1.jpeg"
                class="small-pic-1"
              />
            </div>
            <div class="small-font">
              <p class="small-font-1">
                Korean hairstyles offer a wide variety of choices. You can
                easily find a look to suit any ambiance, from business to
                casual. Browse through our guide to find the most fashionable
                and popular hairstyles for Asian men.
              </p>
            </div>
          </div>

          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../Assets/Images/long-2.jpeg"
                class="small-pic-1"
              />
            </div>
            <div class="small-font">
              <p class="small-font-1">
                It is important to know haircut numbers, as they indicate how
                long your haircut will be after the trim. When opting for a
                specific clipper size, you can expect the corresponding hair
                length. Wanna learn more? Welcome to our guide.
              </p>
            </div>
          </div>
        </div>
      </div>

         <div class="all_styles">
      <%
      List<Style> styles = new StyleService().getAllStyles();
                		
      for(Style style1 : styles) {
    	  
      %>


      <div class="card">
      
          <img class="card_img" src="<%= style1.getHaircutUrl() %>" alt="">
         
          <div class="card-content">
            <h2 class="card-title"><%= style1.getHaircutName() %></h2>
            <p class="card-text"><%= style1.getHaircutAbout() %></p>
          </div>
        </div>
        
        <%
        }
        %>
  <!-- all styles here -->
      </div>
    </section>

  
<!-- footer -->
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
    


<script src="../Assets/JS/search_br.js"></script>
  </body>
</html>
