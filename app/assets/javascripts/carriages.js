$(document).ready(function() {
  $('.hidden_carriage').hide();

  var carriage_class = $('#carriage_type');
  var carriage_choice = '.' + carriage_class.val();

  $(carriage_choice).show();

  $(carriage_class).change(function() {
    $('.hidden_carriage').hide();
    var carriage_choice = '.' + carriage_class.val();
    $(carriage_choice).show();
  });
});
