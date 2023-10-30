<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../Assets/CSS/customer_register.css">
</head>
<body>
<form action="registration" method="post" class="resister_form" >
      <div class="head_div">
        <p class="head">Sign up</p>
      </div>

      <div class="all_inputs">
        <label for="user_name" class="all_label">Username</label>
        <br />

        <input
          required
          name="name"
		  value="Vikram"
          class="input"
          pattern="[A-Za-z0-9]+"
          title="Make sure that name should not contain space"
          type="text"
          id="username"
        />
      </div>
      <br />

      <div class="all_inputs">
        <label for="email" class="all_label">Email Id</label>
        <br />

        <input
        value="vikram@gmail.com"
          required
          class="input"
          type="email" name="email" 
          autocomplete="gghjhfy"
        />
      </div>
      <br />

      <div class="all_inputs">
        <label for="password" class="all_label">Password</label>
        <br />

        <input
          required
          type="password"
		  name="password" 
		  value="Vikram@432"
          pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$"
          title="Must contain at least one number and one uppercase and lowercase letter,at least 8 or more characters and must not contain space "
          class="input"
          id="password"
          autocomplete="password"
        />
      </div>
      <br />

     
      <br />

      <div class="all_inputs">
        <label for="phone" class="all_label">phone number</label>
        <br />

        <input required 
        
        value="9887766576"
        pattern="^\d{10}$"
       title="Phone number with 7-9 and remaing 9 digit with 0-9"
        class="input" type="tel" id="phone_number" name="phonenumber" />
      </div>

      <div class="submit">
        <button class="submit_btn" type="submit" id="btn">Sign up</button>
      </div>
    </form>

</body>
</html>