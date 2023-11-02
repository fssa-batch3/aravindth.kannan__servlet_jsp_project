<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>barber login page</title>
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
    <form action="barberlogin"  method="post" id="b_login_form">
      <div class="content">
        <div class="login">
          <h1 class="login-1">Login</h1>
        </div>
      
        <div class="email-id">
          <p class="email-id-1">Email</p>
        </div>
        <div class="email-id-box">
          <input
          name="barber_email"
            value="mahaan@gmail.com"
            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
            class="email-id-box-1"
            type="email"
            placeholder="abcda@gmail.com"
            id="b_email"
          />
        </div>
        <div class="password">
          <p class="password-1">Password</p>
        </div>
        <input
        name="barber_password"
          value="Akkam432@"
          class="password-box-1"
          type="password"
          placeholder=" 123456"
          id="b_password"
        />
        <div class="Password-box"></div>

        <div class="login-button">
        
          <button class="login-button-1" type="submit">Login</button>
        
        </div>

        <div class="forgot-password">
          <a href="barber_register.jsp" class="forgot-password-1"
            >Sign up</a
          >
        </div>
       
      </div>
    </form>

</body>
</html>