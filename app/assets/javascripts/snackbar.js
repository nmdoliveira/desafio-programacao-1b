window.addEventListener("load", function() {
  var snackbar = document.getElementById("snackbar");
  var text = snackbar.textContent;
  if (text) {
    snackbar.MaterialSnackbar.showSnackbar({ message: text });
  }
});
