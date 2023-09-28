<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<%@ page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page import="com.fssa.sharpandclean.service.StyleService"%>
<%@ page import="com.fssa.sharpandclean.model.Salon"%>
<%@ page import="com.fssa.sharpandclean.model.Style" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>shop detail page</title>
    <link rel="stylesheet" href="../Assets/CSS/shop_detail.css" />
  </head>
  <body>
  
  <%
		int salon_id = Integer.parseInt(request.getParameter("salonId"));

		SalonService salonService = new SalonService();
		Salon salon = null;

		try {
			salon = salonService.getSalonBySalonId(salon_id);
		} catch (ServiceException e) {
			// Handle the exception appropriately, e.g., display an error message to the user or log it
			out.println("Error: " + e.getMessage());
		}
		%>
    <div class="full_content">
      <!-- card side start -->
      <div class="card_and_profile_div">
        <div class="profile">
          <img class="photo" src="<%= salon.getSalonURL() %>" id="photo" alt="shop card profile"/>
          <div class="right_side">
            <p class="text">Sharp & Clean</p>
            <br />
            <p class="text">Official Salons</p>
          </div>
        </div>

        <div class="information">
          <div class="input_div">
            <label class="label">Salon Name </label>
            <br />
            <input value="<%= salon.getSalonName() %>" class="input" type="text" id="shop_name" disabled />
          </div>

          <div class="input_div">
            <label class="label">Salon Experience </label>
            <br />
            <input value="<%= salon.getSalonExperience() %>" class="input" type="text" id="shop_experience" disabled />
          </div>
          <div class="input_div">
            <label class="label"> Salon Area </label>
            <br />
            <input value="<%= salon.getSalonArea() %>" class="input" type="text" id="shop_slogan" disabled />
          </div>
          <div class="input_div">
            <label class="label"> Salon Phone </label>
            <br />
            <input value="<%= salon.getSalonPhone() %>" class="input" type="text" id="shop_haircut_price" disabled />
          </div>

          <div class="big_input_div">
            <label class="label"> Salon Address </label>
            <br />
            <input value="<%= salon.getSalonAddress() %>" class="big_input" type="text" id="shop_address" disabled />
          </div>
          <div class="big_input_div">
            <label class="label">About Salon </label>
            <br />
            <input value="<%=salon.getSalonAbout() %>" class="big_input" type="text" id="shop_about_id" disabled />
          </div>

          <div class="three_buttons">
            <a href="customer_shop_booking_form.jsp?salonId=<%=salon.getSalonId() %>" class="select_btn">Select</a>
            <!-- <a href="./customer_shop_booking_form.html" id="delete_shop" class="create_card">Select</a> -->
          </div>
        </div>
      </div>

      <!-- samples of that shop -->
      <div class="all_haircuts">
        <p class="samples">Salon's sample haircuts</p>
         <%
      List<Style> style = new StyleService().getStylesByEmail(salon.getSalonEmail());
      for(Style style1 : style){  
      %>
      <div class="haircut_card">
      <img src="<%= style1.getHaircutUrl() %>" class="haircut_card_img" />
      <div class="haircut_card-content">
      <h2 class="haircut_card-title"><%= style1.getHaircutName() %></h2>
      <p class="haircut_card-text"><%= style1.getHaircutAbout() %></p>
      <a href="DeleteStyleCardServlet?styleID=<%= style1.getHaircutId() %>" class="haircut_delete">Select</a>
      
      </div>
      
      </div>
      
      <%
       }
      %>
        <div class="about_shop">
        
        </div>
      </div>
      
      <!-- samples of that shop -->
    </div>

    <!-- java script start -->
    
  </body>
</html>
