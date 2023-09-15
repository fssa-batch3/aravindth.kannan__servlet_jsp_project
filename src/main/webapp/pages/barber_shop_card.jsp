<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/barber_card_form.css">
    <title> salon apply</title>
  </head>
  <body>
  
   <%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("barber_login.jsp");
	}
%>

    <!-- section is started -->
    <div class="head">
      <p class="head_text">Register your Salon</p>
    </div>
    <form class="card_form" id="shop_profile_form" action="createsalon" method="post">
      <div class="name">
        <label>Salon name</label>
        <div class="name-box">
          <input
          value="mahaan"
          required
          name="salonName"
          pattern="[A-Za-z0-9]+"
          title="Make sure that name should not contain space"
            id="s_name"
            class="name-box-1"
            type="text"
            autocomplete="name"
          />
        </div>
      </div>
    
      <div class="name">
        <label>Salon photo</label>
        <div class="name-box">
          <input 
          required
           name="salonPhoto"
          class="name-box-1" type="url" id="s_photo" />
        </div>
      </div>
      <div class="email">
        <label> Salon area</label>
        <div class="address-box">
          <input 
          required
           name="salonArea"
          value="The Best Shears in Town."
          class="name-box-1" type="text" id="s_slogan" />
        </div>
      </div>
      <div class="email">
        <label> Salon phone</label>
        <div class="address-box">
          <input 
          value="9887768798"
           name="salonPhone"
          pattern="[7-9]{1}[0-9]{9}" 
       title="Phone number with 7-9 and remaing 9 digit with 0-9"
          required
          class="name-box-1" type="number" id="s_phone" />
        </div>
      </div>
      <div class="experience">
        <label> Salon experience</label>
        <div class="address-box">
          <input 
          required
           name="salonExperience"
          value="15 - years"
          class="name-box-1" type="text" id="s_experience" />
        </div>
      </div>  
       
          <div class="experience">
            <label class="all_label"> Salon Address</label>
            
            <input 
            required
             name="salonAddress"
           value="12 th street, Anna nagar, velachery, Chennai-07."
            id="s_address" class="name-box-1"/>
          </div>

          <div class="experience">
            <label class="all_label">About Salon</label>
            <br />
            <br />
            <input 
            required
             name="salonAbout"
            value="We have a best discount for all haircut and coloring. We have 15 years experience in barber career. We give full satisfy to the customer."
            id="s_about" class="name-box-1"/>
          </div>
          <div class="name">
        <label>Favourite hairstyle 1</label>
        <div class="name-box">
          <input 
           name="Fhaircut1"
          required
          class="name-box-1" type="url" id="s_photo" />
        </div>
      </div>
      <div class="name">
        <label>Favourite hairstyle 2</label>
        <div class="name-box">
          <input 
          required
           name="Fhaircut2"
          class="name-box-1" type="url" id="s_photo" />
        </div>
      </div>
      <div class="name">
        <label>Favourite hairstyle 3</label>
        <div class="name-box">
          <input 
          required
          name="Fhaircut3"
          class="name-box-1" type="url" id="s_photo" />
        </div>
      </div>
      <div class="submit">
        <button class="submit-1">Submit</button>
      </div>
    </form>
    <!-- section is ended -->

    
  </body>
</html>
