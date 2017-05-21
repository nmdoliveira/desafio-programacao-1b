(function() {
  var form = document.getElementById("new_import_form");
  var input = document.getElementById("import_form_file");

  input.addEventListener("change", function() {
    document.getElementById("snackbar").MaterialSnackbar.showSnackbar({
      message: "Seu arquivo foi enviado!"
    });
    form.submit();
  });
})();
