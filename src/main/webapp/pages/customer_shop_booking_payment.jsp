<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="../Assets/CSS/customer_shop_booking_payment.css"
    />
    <title>customer shop booking payment page</title>
  </head>
  <body>
    <div class="full_content">
      <div class="content">
        <div class="right_and_left">
          <div class="left">
            <h2>Schedule Details</h2>
            <ul>
              <li class="date_font" id="cus_name"></li>
              <li class="date_font" id="date"></li>
              <li class="date_font" id="time"></li>
              <li class="date_font" id="haircut_name"></li>
            </ul>
          </div>
          <img alt="shop Image" id="booked_shop_img" class="bottum">
           
        </div>
        <div class="right">
          <h2>Shop Details</h2>

          <p class="shop_text" id="shop_name"></p>
          <p class="shop_text" id="shop_ex"></p>
          <p class="shop_text" id="shop_slogan"></p>
          <p class="shop_text" id="shop_phone"></p>
          <p class="shop_text" id="shop_address"></p>
          <p class="shop_text" id="shop_about"></p>
        </div>
      </div>
      <div class="payment_div" onclick="myFunction()">
        <button class="payment_btn" id="book_btn">Book now</button>
      </div>

      <div class="payment_success_div" id="success_message">
        <img src="../Assets/Images/right_tick.gif" alt="success" />
        <p class="payment_success_div_text">Successfully booked</p>
      </div>
    </div>

    
  </body>
</html>
