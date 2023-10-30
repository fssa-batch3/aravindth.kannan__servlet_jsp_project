<%@ page import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<%@ page import="com.fssa.sharpandclean.service.BarberService"%>
<%@ page import="com.fssa.sharpandclean.model.Barber"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/barber_card_form.css" />
    <title>barber profile edit</title>
  </head>
  <body>
 
    <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("barber_login.jsp");
	}
	
	BarberService barberService = new BarberService();
	Barber barber =  null;
	
	try {
		barber = barberService.getBarberByEmail(loggedInEmail);
	} catch (ServiceException e) {
		// Handle the exception appropriately, e.g., display an error message to the user or log it
		out.println("Error: " + e.getMessage());
	}
	
%>
    <form class="card_form" action="UpdateBarberProfileServlet" method="post" id="E_form">
      <div class="name">
        <label>Name</label>
        <div class="name-box">
          <input
          required
          pattern="[A-Za-z0-9]+"
          title="Make sure that name should not contain space"
            class="name-box-1"
            type="text"
            name="barber_name"
            value="<%= barber.getBarberName() %>"
            autocomplete="name"
          />
        </div>
      </div>
     
      <div class="name">
        <label>Profile-URL</label>
        <div class="name-box">
          <input 
          required
          name="barber_profile"
          value="<%= barber.getBarberProfile() %>"
          class="name-box-1" type="url" id="b_photo" />
        </div>
      </div>
      
      <div class="email">
        <label>Phone</label>
        <div class="address-box">
          <input 
          required
          name="barber_phone"
          value="<%= barber.getBarberPhone() %>"
          class="name-box-1" type="number" id="b_phone_number" />
        </div>
      </div>
      <div class="all_inputs">
        <label>Experience</label>
        <div class="address-box">
          <input 
          name="barber_ex"
          value="<%= barber.getBarberExperience() %>"
          required
          title="Make sure that name should not contain space"
          class="name-box-1" type="text"  />
        </div>
      </div>  
          <div class="all_inputs">
            <label class="all_label">Address</label>
            <br />
            <br />
            <textarea 
            required
            pattern ="[A-Za-z0-9]+" 
            title="Make sure that name should not contain space"
            id="b_address" class="name-box-1" name="barberAddress" rows="5" cols="50"><%= barber.getBarberAddress() %></textarea>
          </div>

          <div class="all_inputs">
            <label class="all_label">Barber About</label>
            <br />
            <br />
            <textarea 
            required
            pattern="[A-Za-z0-9]+"
            title="Make sure that name should not contain space"
            id="about" class="name-box-1" name="barberAbout" rows="5" cols="50"><%= barber.getBarberAbout() %></textarea>
          </div>
          <div class="name">
        <label>Sample Haircut-1</label>
        <div class="name-box">
          <input 
          required
          value="<%= barber.getSample_1()%>"
          class="name-box-1" type="url" id="s_photo" name="sample1"/>
        </div>
      </div>
      <div class="name">
        <label>Sample Haircut-2</label>
        <div class="name-box">
          <input 
          required
          value="<%= barber.getSample_2()%>"
          class="name-box-1" type="url" id="s_photo" name="sample2"/>
        </div>
      </div>
      <div class="name">
        <label>Sample Haircut-3</label>
        <div class="name-box">
          <input 
          required
          value="<%= barber.getSample_3() %>"
          class="name-box-1" type="url" id="s_photo" name="sample3"/>
        </div>
      </div>
      <div class="submit">
        <button class="submit-1">Update</button>
      </div>
    </form>

    <!-- javav-script -->
   
  </body>
</html>
