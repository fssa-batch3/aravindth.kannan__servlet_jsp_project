<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<%@ page import="com.fssa.sharpandclean.service.SalonService"%>
<%@ page import="com.fssa.sharpandclean.model.Salon"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/barber_card_form.css">
    <title> salon edit page</title>
  </head>
  <body>
  
  <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("barber_login.jsp");
	}
	
	SalonService salonService = new SalonService();
	Salon salon =  null;

	try {
		salon = salonService.getSalonBySalonEmail(loggedInEmail);
	} catch (ServiceException e) {
		// Handle the exception appropriately, e.g., display an error message to the user or log it
		out.println("Error: " + e.getMessage());
	}
	
	
%>

    <!-- header is started -->
    <jsp:include page="barber_header.jsp"></jsp:include>
    <!-- header is ended -->

    <!-- section is started -->
    <div class="head">
      <p class="head_text">Update your Salon Profile</p>
    </div>
    <form action="SalonProfileUpdateServlet" method="post" class="card_form" id="shop_E_form">
      <div class="name">
        <label>Salon Name</label>
        <div class="name-box">
          <input
          required
          pattern="[A-Za-z0-9]+"
          title="Make sure that name should not contain space"
            id="s_name"
            class="name-box-1"
            type="text"
            name="salonName"
            value="<%= salon.getSalonName() %>"
            autocomplete="name"
          />
        </div>
      </div>
     
      <div class="name">
        <label>Salon Profile</label>
        <div class="name-box">
          <input 
          required
          class="name-box-1" type="url" id="s_photo" name="salonProfile" value="<%= salon.getSalonURL() %>"/>
        </div>
      </div>
      <div class="email">
        <label> Salon Area</label>
        <div class="address-box">
          <select
            name="salonArea"
            id="haircutid"
            class="name-box-1"
            required
          >
            <option value="Ariyalur">Ariyalur</option>
						<option value="Chennai">Chennai</option>
						<option value="Coimbatore">Coimbatore</option>
						<option value="Cuddalore">Cuddalore</option>
						<option value="Dharmapuri">Dharmapuri</option>
						<option value="Dindigul">Dindigul</option>
						<option value="Erode">Erode</option>
						<option value="Kallakurichi">Kallakurichi</option>
						<option value="Kanchipuram">Kanchipuram</option>
						<option value="Kanyakumari">Kanyakumari</option>
						<option value="Karur">Karur</option>
						<option value="Krishnagiri">Krishnagiri</option>
						<option value="Madurai">Madurai</option>
						<option value="Nagapattinam">Nagapattinam</option>
						<option value="Namakkal">Namakkal</option>
						<option value="Nilgiris">Nilgiris</option>
						<option value="Perambalur">Perambalur</option>
						<option value="Pudukkottai">Pudukkottai</option>
						<option value="Ramanathapuram">Ramanathapuram</option>
						<option value="Salem">Salem</option>
						<option value="Sivaganga">Sivaganga</option>
						<option value="Tenkasi">Tenkasi</option>
						<option value="Thanjavur">Thanjavur</option>
						<option value="Theni">Theni</option>
						<option value="Thoothukudi">Thoothukudi</option>
						<option value="Tiruchirapalli">Tiruchirapalli</option>
						<option value="Tirunelveli">Tirunelveli</option>
						<option value="Tirupathur">Tirupathur</option>
						<option value="Tiruppur">Tiruppur</option>
						<option value="Tiruvallur">Tiruvallur</option>
						<option value="Tiruvannamalai">Tiruvannamalai</option>
						<option value="Tiruvarur">Tiruvarur</option>
						<option value="Vellore">Vellore</option>
						<option value="Viluppuram">Viluppuram</option>
						<option value="Virudhunagar">Virudhunagar</option>
          </select>
        </div>
      </div>
      <div class="email">
        <label> Salon Phone</label>
        <div class="address-box">
          <input 
          value="<%= salon.getSalonPhone() %>"
          required
          pattern="[7-9]{1}[0-9]{9}" 
          title="Phone number with 7-9 and remaing 9 digit with 0-9"
          class="name-box-1" type="tel" id="s_phone" name="salonPhone" />
        </div>
      </div>
      <div class="experience">
        <label> Salon Experience</label>
        <div class="address-box">
          <input 
          required
         	value="<%= salon.getSalonExperience() %>"
          class="name-box-1" type="text" id="s_experience" name="experience"/>
        </div>
      </div>  
      
          <div class="all_inputs">
            <label class="all_label"> Salon Address</label>
            <br />
            <br />
            <textarea 
            required
           	
            id="s_address" class="name-box-1" name="address" rows="5" cols="50"><%= salon.getSalonAddress() %></textarea>
          </div>

          <div class="all_inputs">
            <label class="all_label">About Salon</label>
            <br />
            <br />
            <textarea 
            required
            
            id="s_about" class="name-box-1" name="aboutSalon" rows="5" cols="50"><%= salon.getSalonAbout() %></textarea>
          </div>
          <div class="name">
        <label>Sample Haircut-1</label>
        <div class="name-box">
          <input 
          required
          value="<%= salon.getSalonSample1() %>"
          class="name-box-1" type="url" id="s_photo" name="sample1"/>
        </div>
      </div>
      <div class="name">
        <label>Sample Haircut-2</label>
        <div class="name-box">
          <input 
          required
          value="<%= salon.getSalonSample2() %>"
          class="name-box-1" type="url" id="s_photo" name="sample2"/>
        </div>
      </div>
      <div class="name">
        <label>Sample Haircut-3</label>
        <div class="name-box">
          <input 
          required
          value="<%= salon.getSalonSample3() %>"
          class="name-box-1" type="url" id="s_photo" name="sample3"/>
        </div>
      </div>
      <div class="submit">
        <button class="submit-1">Update</button>
      </div>
    </form>
    <!-- section is ended -->

    <!-- java script -->
   
    
  </body>
</html>
