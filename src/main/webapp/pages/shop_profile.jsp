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
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/shop_profile.css" />
    <title>shop profile</title>
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
    <div class="topic_div">
      <h1 class="topic">Salon Profile</h1>
    </div>
    
   

    <div class="full_content">
      <!-- card side start -->
      <div class="card_and_profile_div">
        <div class="profile">
          <img src="<%= salon.getSalonURL() %>" class="photo" alt="shop profile photo" />
          <div class="right_side">
            <p class="text">Sharp & Clean</p>
            <br />
            <p class="text">Official Salon</p>
          </div>
        </div>

        <div class="card_text_div">
          <p class="Your_card">Your card</p>
        </div>
        <!-- card for shop -->

        <div class="container">
          <div class="profile-card">
            <img
              id="card_profile"
              alt="shop image"
              class="img-responsive"
              src="<%= salon.getSalonURL() %>"
            />
            <div class="name_div">
              <h2 id="card_b_name" class="hvr-underline-from-center">
                <%= salon.getSalonName() %>
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
                src="<%= salon.getSalonSample1() %>"
              />

              <img
                id="card_sample_2"
                alt="haircutname"
                class="profile-pic"
                src="<%= salon.getSalonSample2() %>"
              />

              <img
                id="card_sample_3"
                alt="haircutname"
                class="profile-pic"
                src="<%= salon.getSalonSample3() %>"
              />
            </div>

              <div class="two_btn_div">
              <p class="select_btn">Details</p>
              <p class="select_btn">Select</p>
            </div> 
          </div>
        </div>
        <br>
        <br>

        <!-- card end -->

       
      </div>
      <!-- card side end -->

      <!-- about shop start -->
      <div class="about_shop">
        <div class="information">
          <div class="input_div">
            <label class="label">Salon Name: </label>
            <br />
            <input value="<%= salon.getSalonName() %>" class="input" type="text" id="shop_name" disabled />
          </div>

          <div class="input_div">
            <label class="label">Salon experience: </label>
            <br />
            <input value="<%= salon.getSalonExperience() %>" class="input" type="text" id="shop_experience" disabled />
          </div>
          <div class="input_div">
            <label class="label"> Salon Area: </label>
            <br />
            <input value="<%= salon.getSalonArea() %>" class="input" type="text" id="shop_slogan" disabled />
          </div>
         
          <div class="input_div">
            <label class="label"> Salon phone number: </label>
            <br />
            <input value="<%= salon.getSalonPhone() %>" class="input" type="text" id="shop_phone_number" disabled />
          </div>
          <div class="big_input_div">
            <label class="label"> Shop address: </label>
            <br />
            <input value="<%= salon.getSalonAddress() %>" class="big_input" type="text" id="shop_address" disabled />
          </div>
          <div class="about_div">
            <label class="label">About shop: </label>
            <br />
            <input value="<%= salon.getSalonAbout() %>" class="big_input" type="text" id="shop_about_id" disabled />
          </div>
        </div>

        <div class="three_buttons">
          <a class="create_card" href="shop_profile_edit.jsp">Edit Profile</a>
          <a href="<%=request.getContextPath() %>/DeleteSalonServlet?salonEmail=<%= salon.getSalonEmail() %>" class="create_card">Delete Profile</a>
        </div>
      </div>
      <!-- about side end -->
    </div>

    <!-- add more haircut designs -->
    
    <% String errMsg = request.getParameter("error");
    if(errMsg!=null){
    	%>
      	<p>Error In create style: <%=errMsg%> </p>
    	<%
    }
    %>

    <div class="all_haircut_designs">
      <div class="form_div">
        <p>Add Haircuts</p>
        <form id="add_form_1" class="add_style_form" action="CreateStyleServlet" method="post">
        <input type="hidden" name="haircut_email" value="<%= loggedInEmail%>"/>
          <div class="small_form_div">
            <label class="label">Haircut Name</label>

            <br />
            <input
            name="haircutName"
              value="Oil facial"
              required
              pattern="[A-Z a-z]{1,32}"
              title="Make sure that name should space"
              id="style_name"
              class="name-box-1"
              type="text"
              autocomplete="name"
            />
          </div>

          <div class="small_form_div">
            <label class="label"> Select service</label>
            <br />
            <select name="haircutType"  id="type_id" class="name-box-1" required>
              <option>Haircut</option>
              <option>Hair coloring</option>
              <option>Hair straightening</option>
              <option>Facials</option>
              <option>Shaves</option>
              <option>Beard trim</option>
            </select>
          </div>

          <div class="small_form_div">
            <label class="label">Description</label>

            <br />
            <input
            name="haircutAbout"
              value="In this service we use oil to wash your face and we give oil facial. after this facial your face look very soft."
              required
              id="style_para"
              class="name-box-1"
              type="text"
              autocomplete="name"
            />
          </div>

          <div class="small_form_div">
            <label class="label">Haircut photo</label>
            <br />
            <input name="haircutURL" required class="name-box-1" type="url" id="design_photo" />
          </div>
          <div class="three_buttons">
            <button class="submit_1">Submit</button>
          </div>
        </form>
      </div>

      <div class="haircuts"></div>
    </div>
    <!-- section is ended -->

    <!-- Java Script -->

 
  </body>
</html>
