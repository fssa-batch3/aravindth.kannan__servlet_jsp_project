<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>fade</title>
    <link rel="stylesheet" href="../Assets/CSS/hair_style.css" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
  </head>
  <body>
    <jsp:include page="barber_header.jsp" />

    <!-- search bar  start-->
    <div class="search_bar_div">
      <input placeholder="Search here.." type="text" class="search_bar" id="search_bar_id"/>
    </div>
     <!-- search bar end-->
    
 

    <div class="Short">
      <p class="short-1">Hair straightening</p>
    </div>
    <section>
      <div class="big-div">
        <div class="big-img">
          <img
            alt="image"
            src="../Assets/Images/fade-0.jpeg"
            class="big-img-1"
          />
        </div>
        <div class="two-img">
          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../Assets/Images/fade-1.jpeg"
                class="small-pic-1"
              />
            </div>
            <div class="small-font">
              <p class="small-font-1">
                Korean hairstyles offer a wide variety of choices. You can
                easily find a look to suit any ambiance, from business to
                casual. Browse through our guide to find the most fashionable
                and popular hairstyles for Asian men.
              </p>
            </div>
          </div>

          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../Assets/Images/fade-2.jpeg"
                class="small-pic-1"
              />
            </div>
            <div class="small-font">
              <p class="small-font-1">
                It is important to know haircut numbers, as they indicate how
                long your haircut will be after the trim. When opting for a
                specific clipper size, you can expect the corresponding hair
                length. Wanna learn more? Welcome to our guide.
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- 8 styles -->
      <div class="all_styles">
      <!-- all style here -->
    </div>
    </section>

    <div class="back_div">
      <a class="back_btn" href="./barber_home.html">Back</a>
    </div>

    <footer>
      <div class="footer">
        
          <div class="footicons">
            <a href="#"
              ><img
                class="footround"
                src="../Assets/Images/Y- facebook.png"
                alt="What's app"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../Assets/Images/Y- insta.png"
                alt="face book"
            /></a>
            <a href="#">
              <img
                class="footround"
                src="../Assets/Images/Y- twitter.png"
                alt="instagram"
            /></a>
           
          </div>
          <br>
          <div class="footer_firsthalf">
            <a>Home</a>
            <a>Services</a>
            <a>About</a>
            <a>terms</a>
            <a>Privacy policy</a>
        </div>
        <div class="copy_right_div">
          <pre>sharp & clean  <img alt="copy right" class="c_round" src="../Assets/Images/C - copyright.png"/>  2023</pre>
        </div>
      </div>
    </footer>

    <!-- java script -->

    <script>
      // JSON
      let hair_type = "Hair straightening";
      const shopNewHaircuts = JSON.parse(localStorage.getItem("shop_newhaircuts")).filter( F => F.shop_hair_type == hair_type);

      // card java script

      for (let i = 0; i < shopNewHaircuts.length; i++) {
        let big_div = document.createElement("div");
        big_div.setAttribute("class", "card");
        document.querySelector(".all_styles").append(big_div);

        let image = document.createElement("img");
        image.setAttribute("class", "card_img");
        image.setAttribute("src", shopNewHaircuts[i]["shop_haircutImage"]);
        image.setAttribute("alt", shopNewHaircuts[i]["shop_haircutname"]);
        image.setAttribute("alt", "image");
        big_div.append(image);

        let content_div = document.createElement("div");
        content_div.setAttribute("class", "card-content");
        big_div.append(content_div);

        let name = document.createElement("h2");
        name.setAttribute("class", "card-title");
        name.innerText = shopNewHaircuts[i]["shop_haircutname"];
        content_div.append(name);

        let text = document.createElement("p");
        text.setAttribute("class", "card-text");
        text.innerText = shopNewHaircuts[i]["shop_haircut_para"];
        content_div.append(text);
      }

      
    </script>
    <script src="../Assets/JS/search_br.js"></script>

  </body>
</html>
