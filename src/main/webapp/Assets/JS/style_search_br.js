const searchbar = document.getElementById("search_bar_id");
  const cards = document.getElementsByClassName("haircut_card");

  searchbar.addEventListener("input", () => {
    for (let element of cards) {
      if (
        element.innerHTML.toLowerCase().includes(searchbar.value.toLowerCase())
      ) {
        element.style.display = "block";
      } else {
        element.style.display = "none";
      }
    }
  });