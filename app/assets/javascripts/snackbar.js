$(window).on("load", function() {
  var snackbar = $("#snackbar");
  var text = snackbar.text();

  if (text)
    setTimeout(function() {
      snackbar[0].MaterialSnackbar.showSnackbar({ message: text });
    });
});
