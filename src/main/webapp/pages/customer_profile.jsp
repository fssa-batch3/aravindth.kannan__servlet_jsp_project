<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<%@ page import="com.fssa.sharpandclean.service.UserService"%>
<%@ page import="com.fssa.sharpandclean.model.User"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/customer_profile.css" />
    <title>customer profile</title>
  </head>
  <body>
  
  <% 
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("customer_login.jsp");
	}
		UserService userService = new UserService();
		User user = null;

		try {
		 user = userService.getUser(loggedInEmail);
		} catch (ServiceException e) {
			// Handle the exception appropriately, e.g., display an error message to the user or log it
			out.println("Error: " + e.getMessage());
		}
		%>
    <!-- header is started -->
    <jsp:include page="customer_header.jsp" />
    <!-- header is ended -->

    <!-- section is started -->

    <form action="UpdateUserServlet" method="post"  class="profile_form" id="form_p">
      <div class="head_div">
        <h2 class="head">User Profile</h2>
      </div>
      <div class="form-group">
        <label for="email" class="all_label">username:</label>
        <br />
        <br />
        <input value="<%= user.getUsername() %>" class="form-control personName" id="usernsme"  />
      </div>
      <div class="form-group">
        <label for="email" class="all_label">Email:</label>
        <br />
        <br />
        <input value="<%= loggedInEmail%>" type="email" class="form-control personEmail" id="email" disabled />
      </div>
      <div class="form-group">
        <label for="pwd" class="all_label">Password:</label>
        <br />
        <br />
        <input value="<%= user.getPassword() %>" type="password" class="form-control personPassword" id="password"  />
      </div>
	
      <div class="form-group">
        <label for="pwd" class="all_label">Phone number:</label>
        <br />
        <br />
        <input value="<%= user.getPhonenumber() %>" type="text" class="form-control personPhone" id="phone"  />
      </div>

      <div class="submit">
        <button action="LogoutServlet" method="Get" type="submit" class="delete_btn" id="delete_button">
          Logout
        </button>
        <a class="submit_btn" > Update </a>
      </div>
    </form>

    <!-- section is ended -->

    
  </body>
</html>
