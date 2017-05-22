(function() {
  var form = $("#new_import_form");
  var input = $("#import_form_file");
  var button = $("#file_upload_button");
  var progress = $("#import_progress");

  input.on("change", function() {
    $("#snackbar")[0].MaterialSnackbar.showSnackbar({
      message: "Seu arquivo está sendo processado!",
      timeout: 1000
    });
    setTimeout(function() { form.submit(); }, 1500);

    button.attr("disabled", "disabled");
    progress.removeClass("mdl-progress__hide");
  });
})();
