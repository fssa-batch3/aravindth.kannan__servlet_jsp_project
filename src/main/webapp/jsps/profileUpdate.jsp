<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("login.jsp");
	}
%>

<p>Logged In user: <%=loggedInEmail%> </p>
<form class="profile_form" id="form_p" action="UpdateUserServlet" method="post">
      <div class="head_div">
        <h2 class="head">User Profile</h2>
      </div>
      <div class="form-group">
        <label for="email" class="all_label">username:</label>
        <br />
        <br />
        <input  required
          name="name"
		  
          class="input"
          pattern="[A-Za-z0-9]+"
          title="Make sure that name should not contain space"
          type="text"
          id="username"  />
      </div>
     
      <div class="form-group">
        <label for="pwd" class="all_label">Password:</label>
        <br />
        <br />
        <input required
          type="password"
		  name="password" 
		  
          pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$"
          title="Must contain at least one number and one uppercase and lowercase letter,at least 8 or more characters and must not contain space "
          class="input"
          id="password"
          autocomplete="password"  />
      </div>

      <div class="form-group">
        <label for="pwd" class="all_label"> Confirm Password:</label>
        <br />
        <br />
        <input
          required
          type="password"
		  name="password" 
		  
          pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$"
          title="Must contain at least one number and one uppercase and lowercase letter,at least 8 or more characters and must not contain space "
          class="input"
          id="password"
          autocomplete="password"
          
        />
      </div>

      <div class="form-group">
        <label for="pwd" class="all_label">Phone number:</label>
        <br />
        <br />
        <input  required 
        pattern="[7-9]{1}[0-9]{9}" 
       title="Phone number with 7-9 and remaing 9 digit with 0-9"
        class="input" type="number" id="phone_number" name="phonenumber"  />
      </div>

      <div class="submit">
       
        <button class="submit_btn" href="../jsps/profileUpdate.jsp"> Update </button>
      </div>
    </form>
</body>
</html>