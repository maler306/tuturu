$(document).ready(function() {
  $('a.edit_train').click(function(e) {
    e.preventDefault();
    var train_id;
    var form;
    var number;

    train_id = $(this).data('trainId');
    form = $('#edit_train_' + train_id);
    number = $('#train_number_' + train_id);

    if (!$(this).hasClass('Cancel')) {
      $(this).html('Отменить');
      $(this).addClass('Cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('Cancel');
    }

    form.toggle();
    number.toggle();
  })
});
