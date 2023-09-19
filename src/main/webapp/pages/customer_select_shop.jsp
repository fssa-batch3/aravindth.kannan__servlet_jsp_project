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
    <p class="big-font">Select Your Shop</p>
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
              <a class="select_btn">Select</a>
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
    <script>
      

      const select_shop_list = [];

      // Java Script

      let shop_card = JSON.parse(localStorage.getItem("shop_card"));

      for (let i = 0; i < shop_card.length; i++) {
        select_shop_list.push(shop_card[i]);
      }

      for (i = 0; i < select_shop_list.length; i++) {
        const barber = select_shop_list[i];

        let content = document.createElement("div");
        content.setAttribute("class", "card");

        let profile_card = document.createElement("div");
        profile_card.setAttribute("class", "profile-card");
        content.append(profile_card);

        let shop_image = document.createElement("img");
        shop_image.setAttribute("class", "img-responsive");
        shop_image.setAttribute("alt", select_shop_list[i]["shop_card_name"]);
        shop_image.setAttribute("src", select_shop_list[i]["shop_card_photo"]);
        profile_card.append(shop_image);

        let name_div = document.createElement("div");
        name_div.setAttribute("class", "name_div");
        profile_card.append(name_div);

        let name = document.createElement("h2");
        name.setAttribute("class", "hvr-underline-from-center");
        name.innerText = select_shop_list[i]["shop_card_name"];
        name_div.append(name);

        let sample_div = document.createElement("div");
        sample_div.setAttribute("class", "sample_text_div");
        profile_card.append(sample_div);

        let sample_text = document.createElement("h2");
        sample_text.setAttribute("class", "hvr-underline-from-center");
        sample_text.innerText = "Sample haircuts";
        sample_div.append(sample_text);

        let sample_img_div = document.createElement("div");
        sample_img_div.setAttribute("class", "profile-info");
        profile_card.append(sample_img_div);

        let sample_image = document.createElement("img");
        sample_image.setAttribute("class", "profile-pic");
        sample_image.setAttribute("src", select_shop_list[i]["shop_sample"]);
        sample_image.setAttribute("alt", select_shop_list[i]["shop_card_name"]);
        sample_img_div.append(sample_image);

        let sample_image_1 = document.createElement("img");
        sample_image_1.setAttribute("class", "profile-pic");
        sample_image_1.setAttribute(
          "src",
          select_shop_list[i]["shop_sample_1"]
        );
        sample_image_1.setAttribute(
          "alt",
          select_shop_list[i]["shop_card_name"]
        );
        sample_img_div.append(sample_image_1);

        let sample_image_2 = document.createElement("img");
        sample_image_2.setAttribute("class", "profile-pic");
        sample_image_2.setAttribute(
          "src",
          select_shop_list[i]["shop_sample_2"]
        );
        sample_image_2.setAttribute(
          "alt",
          select_shop_list[i]["shop_card_name"]
        );
        sample_img_div.append(sample_image_2);

        let select_div = document.createElement("div");
        select_div.setAttribute("class", "two_btn_div");
        profile_card.append(select_div);

        let detail_btn = document.createElement("a");
        detail_btn.setAttribute("class", "select_btn");
        detail_btn.setAttribute(
          "href",
          "./shop_detail_page.html?id=" + select_shop_list[i]["shop_card_id"]
        );
        detail_btn.innerText = "Details";
        select_div.append(detail_btn);

        let select_btn = document.createElement("a");
        select_btn.setAttribute("class", "select_btn");
        select_btn.setAttribute(
          "href",
          "./customer_shop_booking_form.html?id=" +
            select_shop_list[i]["shop_card_id"]
        );
        select_btn.innerText = "Select";
        select_div.append(select_btn);

        document.querySelector(".all-content").append(content);
      }
    </script>

  <script src="../Assets/JS/search_br.js"></script>
  </body>
</html>
