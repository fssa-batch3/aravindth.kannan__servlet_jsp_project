<%@page import="com.fssa.sharpandclean.service.StyleService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.sharpandclean.model.Style"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/universe.css">
<link rel="stylesheet" href="../css/getAllStyle.css">
<title>Get all Styles</title>
</head>
<body>
<header>
        <div class="header">
          <div>
            <a href="../pages/customer_home.html">
              <img
                class="logo_img"
                src="../images/sharp logo black.png"
                alt="logo"
              />
            </a>
          </div>
          <div>
            <nav class="All-navs">
              <div class="nav_dropdown">
                <button class="nav_dropbtn">Hair styles</button>
                <div class="nav_dropdown-content">
                  <a href="../pages/customer_medium_style.html">Haircut</a>
                <a href="../pages/customer_fade_style.html">Hair straightening</a>
                <a href="../pages/customer_long_style.html">Hair coloring</a>
                <a href="../pages/customer_undercut_style.html">Facials</a>
                <a href="../pages/customer_short_style.html">Shaves</a>
                <a href="../pages/customer_beard_style.html">Beard trim</a>
                </div>
              </div>
              <a class="nav" href="../pages/customer_book_now.html">book now</a>
              <a class="nav" href="./customer_booked_history.html">Booked history</a>
              <a class="nav" href="../pages/customer_profile.html"
                ><img
                  src="../images/profile-2.png"
                  alt="profile"
                  height="30px"
                  width="30px"
              /></a>
            </nav>
          </div>
        </div>
      </header>

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
            src="../images/long-0.jpeg"
            class="big-img-1"
          />
        </div>
        <div class="two-img">
          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../images/long-1.jpeg"
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
                src="../images/long-2.jpeg"
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

      <!-- 8 styles -->
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

    <div class="back_div">
      <a class="back_btn" href="./customer_home.html">Back</a>
    </div>

    <footer>
      <div class="footer">
        
          <div class="footicons">
            <a href="#"
              ><img
                class="footround"
                src="../images/Y- facebook.png"
                alt="What's app"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../images/Y- insta.png"
                alt="face book"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../images/Y- twitter.png"
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
          <pre>sharp & clean  <img alt="copy right" class="c_round" src="../images/C - copyright.png"/>  2023</pre>
        </div>
      </div>
    </footer>
</body>
</html>