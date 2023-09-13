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
    <!-- header is started -->
    <jsp:include page="customer_header.jsp" />
    <!-- header is ended -->

    <!-- section is started -->

    <form class="profile_form" id="form_p">
      <div class="head_div">
        <h2 class="head">User Profile</h2>
      </div>
      <div class="form-group">
        <label for="email" class="all_label">username:</label>
        <br />
        <br />
        <input type="name" class="form-control personName" id="usernsme"  disabled/>
      </div>
      <div class="form-group">
        <label for="email" class="all_label">Email:</label>
        <br />
        <br />
        <input type="email" class="form-control personEmail" id="email" disabled />
      </div>
      <div class="form-group">
        <label for="pwd" class="all_label">Password:</label>
        <br />
        <br />
        <input type="password" class="form-control personPassword" id="password"  disabled/>
      </div>

      <div class="form-group">
        <label for="pwd" class="all_label"> Confirm Password:</label>
        <br />
        <br />
        <input
          type="password"
          class="form-control personcPassword"
          id="c_password"
          disabled
        />
      </div>

      <div class="form-group">
        <label for="pwd" class="all_label">Phone number:</label>
        <br />
        <br />
        <input type="text" class="form-control personPhone" id="phone"  disabled/>
      </div>

      <div class="submit">
        <button type="submit" class="delete_btn" id="delete_button">
          Delete
        </button>
        <a class="submit_btn" href="./customer_profile_edit.html"> Edit </a>
      </div>
    </form>

    <!-- section is ended -->

    <script>
     

      // java Script

      // get data from local storage
      const thisUser = JSON.parse(localStorage.getItem("this_user"));
      const userInfo = JSON.parse(localStorage.getItem("userinfo"));
      // get object from local storage by email
      let oneUser = userInfo.find(function (event) {
        let userEmail = event["email"];
        if (thisUser == userEmail) {
          return true;
        }
      });

      const usename = document.querySelector(".personName");
      const useemail = document.querySelector(".personEmail");
      const usePassword = document.querySelector(".personPassword");
      const usecpassword = document.querySelector(".personcPassword");
      const usePhone = document.querySelector(".personPhone");

      usename.value = oneUser["userName"];
      useemail.value = oneUser["email"];
      usePassword.value = oneUser["email_password"];
      usecpassword.value = oneUser["emailc_password"];
      usePhone.value = oneUser["phoneNumber"];

      // delete function 
      let delete_oneuser = document.getElementById("delete_button");
      delete_oneuser.addEventListener("click", function (event) {
        event.preventDefault();
        let index = userInfo.indexOf(oneUser);
        let msg = confirm("Are you sure you want to delete this account");
        if (msg !== true) {
          return;
        } else {
          userInfo.splice(index, 1);

          localStorage.setItem("userinfo", JSON.stringify(userInfo));
          window.location.href = "../index.html";
        }
      });

    

      // logout function!
      let logout = document.getElementById("logout");
      logout.addEventListener("click", function (event) {
        event.preventDefault();
        let msg = confirm("Are you sure you want to logout this account");
        if (msg !== true) {
          return;
        } else {
          localStorage.setItem("this_user", JSON.stringify(null));
           window.location.href ="../index.html";
        }
      });
    </script>
  </body>
</html>
