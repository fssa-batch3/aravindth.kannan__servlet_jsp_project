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
      background-color: grey;
      
    }

    .container {
    
      max-width: 600px;
      margin: 3% auto;
      padding: 20px;
      background: rgb(240,244,240);
      background: radial-gradient(circle, rgba(240,244,240,1) 0%, rgba(222,233,241,1) 100%);
      border-radius: 5px;
      box-shadow: 0 0 10px black;
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
      width: 97%;
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
      background-color: black;
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
      
      
      <!-- Barber Profile URL -->
      <label for="profile_url">Sample haircut 1:</label>
      <input type="url" id="profile_url"  value="https://i.pinimg.com/originals/18/a5/79/18a5792983a99ed184c7a20c35366821.jpg" name="sample_1" required>
      
      
      <!-- Barber Profile URL -->
      <label for="profile_url">Sample haircut 2:</label>
      <input type="url" id="profile_url"  value="https://i.pinimg.com/originals/18/a5/79/18a5792983a99ed184c7a20c35366821.jpg" name="sample_2" required>
      
      <!-- Barber Profile URL -->
      <label for="profile_url">Sample haircut 3:</label>
      <input type="url" id="profile_url"  value="https://i.pinimg.com/originals/18/a5/79/18a5792983a99ed184c7a20c35366821.jpg" name="sample_3" required>
      <!-- Submit Button -->
      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>











