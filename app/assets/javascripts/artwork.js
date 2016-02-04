// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.contains = function(it) { return this.indexOf(it) != -1; };

function search() {
  searchQuery = document.querySelector(".js-search").value.toLowerCase();
  console.log(searchQuery);
  Array.prototype.forEach.call(document.querySelectorAll(".artwork-list-item"), function(item) {
    text = item.querySelector(".js-title").textContent.toLowerCase();
    if(text.contains(searchQuery) || searchQuery == "") {
      item.style.display = "list-item";
    } else {
      item.style.display = "none";
    }
  });
}
