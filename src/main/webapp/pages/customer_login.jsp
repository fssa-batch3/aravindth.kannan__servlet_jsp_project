<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User login page</title>
<link rel="stylesheet" href="../Assets/CSS/login.css">
</head>
<body>

	 <div class="logo-div">
      <img
        class="logo"
        alt="image"
        src="../Assets/Images/sharp logo black.png"
      />
    </div>
    <form action="login"  method="post">
      <div class="content">
        <div class="login">
          <h1 class="login-1">Login</h1>
        </div>

        <% 
			String errorMessage = request.getParameter("error");
			if(errorMessage != null){
				%>
				<div class="styledbutton" id="styledbuttonlogin">
		    	   <%=errorMessage %><!-- this will change based on invalid field entered -->
		    	</div>
		    	<%
			}
		%>
		
		
        <div class="email-id">
          <p class="email-id-1">Email</p>
        </div>
        <div class="email-id-box">
          <input
          value="maha@gmail.com"
            class="email-id-box-1"
            type="email"
            name="email"
            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
            placeholder="abcd@gmail.com "
            required
            id="email"
          />
        </div>
        <div class="password">
          <p class="password-1">Password</p>
        </div>
        
        
        <input value="Akkam432@"
          class="password-box-1"
          type="password"
          name="password"
          placeholder="12345678 "
          required
          id="password"
        />
        <div class="Password-box"></div>

        <div class="login-button">
          <button class="login-button-1" type="submit" >Login</button>
        </div>

        <div class="forgot-password">
          <a href="<%=request.getContextPath()%>/pages/customer_register.jsp" class="forgot-password-1"
            ><p>Sign up</p></a
          >
        </div>
      </div>
    </form>
</body>
</html>
