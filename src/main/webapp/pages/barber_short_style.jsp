<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/CSS/universe.css" />
    <link rel="stylesheet" href="../Assets/CSS/hair_style.css" />
    <title>short_style</title>
  </head>
  <body>
    <!-- header is started -->
    <jsp:include page="barber_header.jsp" />
    <!-- header is ended -->

    <!-- search bar  start-->
    <div class="search_bar_div">
      <input placeholder="Search here.." type="text" class="search_bar" id="search_bar_id"/>
    </div>
     <!-- search bar end-->

    <!-- section is started -->
    <div class="Short">
      <p class="short-1">Shaves</p>
    </div>
    <section>
      <div class="big-div">
        <div class="big-img">
          <img
            alt="image"
            src="../Assets/Images/short haircut big.jpg"
            class="big-img-1"
          />
        </div>
        <div class="two-img">
          <div class="font-1">
            <div class="small-pic">
              <img
                alt="image"
                src="../Assets/Images/short-0.webp"
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
                src="../Assets/Images/short-1.jpg"
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
 <!-- all styles here -->
      </div>
    </section>

    <div class="back_div">
      <a class="back_btn" href="./barber_home.html">Back</a>
    </div>
    <!-- section is ended -->

    <!-- footer is started -->
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
    <!-- footer is ended -->

    <script>
      // JSON
      let hair_type = "Shaves";
      const barberNewHaircuts = JSON.parse(
        localStorage.getItem("newhaircuts")
      ).filter(F => F.barber_hair_type == hair_type);
      

      // card java script

      for (let i = 0; i < barberNewHaircuts.length; i++) {
        let big_div = document.createElement("div");
        big_div.setAttribute("class", "card");
        document.querySelector(".all_styles").append(big_div);

        let image = document.createElement("img");
        image.setAttribute("class", "card_img");
        image.setAttribute("src", barberNewHaircuts[i]["haircutImage"]);
        image.setAttribute("alt", barberNewHaircuts[i]["haircutname"]);
        image.setAttribute("alt", "image");
        big_div.append(image);

        let content_div = document.createElement("div");
        content_div.setAttribute("class", "card-content");
        big_div.append(content_div);

        let name = document.createElement("h2");
        name.setAttribute("class", "card-title");
        name.innerText = barberNewHaircuts[i]["haircutname"];
        content_div.append(name);

        let text = document.createElement("p");
        text.setAttribute("class", "card-text");
        text.innerText = barberNewHaircuts[i]["haircut_para"];
        content_div.append(text);
      }

      
    </script>
    <script src="../Assets/JS/search_br.js"></script>
  </body>
</html>
