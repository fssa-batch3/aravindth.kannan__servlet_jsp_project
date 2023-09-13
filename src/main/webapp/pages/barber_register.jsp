<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <title>Barber Registration</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    .container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="tel"],
    input[type="url"],
    input[type="number"],
    textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    input[type="submit"] {
      background-color: #007BFF;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Barber Registration</h2>
    <form action="register" method="post">
      <!-- Barber Name -->
      <label for="barber_name">Barber Name:</label>
      <input type="text" id="barber_name" name="barber_name" required>
      
      <!-- Barber Email -->
      <label for="barber_email">Barber Email:</label>
      <input type="email" id="barber_email" value="guna@gmail.com" name="barber_email" required>
      
      <!-- Barber Password -->
      <label for="barber_password">Barber Password:</label>
      <input type="password" id="barber_password" value="Akkam432@" name="barber_password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" 
             title="Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number." required>
      
      <!-- Barber Confirm Password -->
      <label for="confirm_password">Confirm Password:</label>
      <input type="password" value="Akkam432@" id="confirm_password" name="confirm_password" required>
      
      <!-- Barber Phone Number  -->
      <label for="barber_phone">Barber Phone Number:</label>
      <input type="tel" id="barber_phone" name="barber_phone"   pattern="^\d{10}$"
            value="9887766554" title="Please enter a valid 10-digit phone number" required>
      
      <!-- Barber Profile URL -->
      <label for="profile_url">Barber Profile URL:</label>
      <input type="url" id="profile_url"  value="https://i.pinimg.com/originals/18/a5/79/18a5792983a99ed184c7a20c35366821.jpg" name="profile_url" required>
      
      <!-- Barber Experience -->
      <label for="barber_experience">Barber Experience</label>
      <input type="text" id="barber_experience" value="I have seven years experience in this barber field." name="barber_experience"  required>
      
      <!-- Barber Address -->
      <label for="barber_address">Barber Address:</label>
      <textarea id="barber_address" name="barber_address" value="3/12, West street, perungudi, Chennai -07." required></textarea>
      
      <!-- Barber About -->
      <label for="barber_about">About Barber:</label>
      <textarea id="barber_about" name="barber_about" value="a person whose occupation is mainly to cut, dress, groom, style and shave men's and boys' hair or beards. " required></textarea>
      
      <!-- Submit Button -->
      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>
</html>











