<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<%@ page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page import="com.fssa.sharpandclean.model.Salon"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="../Assets/CSS/customer_shop_booking_payment.css"
    />
    <title>customer salon booked page</title>
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
      <div class="content">
       
        <div class="left">
         
          <img src="<%= salon.getSalonURL() %>" alt="shop Image"  class="bottum">
           
        </div>
        <div class="right">
          <h2>Salon Details</h2>

          <p class="shop_text" ><span class="text">Salon Name :</span> <%= salon.getSalonName() %></p>
          <p class="shop_text" ><span class="text">Salon Phone :</span> <%= salon.getSalonPhone() %></p>
          <p class="shop_text" ><span class="text">Salon Arae :</span> <%= salon.getSalonArea() %></p>
          <p class="shop_text" ><span class="text">Salon Experience :</span> <%= salon.getSalonExperience() %></p>
          <p class="shop_text" ><span class="text">Salon Address :</span> <%= salon.getSalonAddress() %></p>
          <p class="shop_text" ><span class="text">About Salon :</span> <%= salon.getSalonAbout() %></p>
        </div>
       
      </div>
      <div class="payment_btn" >
       
         <p > Successfully booked</p>
      </div>

    </div>

    
  </body>
</html>
