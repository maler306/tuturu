$(document).ready(function() {
  $('a.edit_route').click(function(e) {
    e.preventDefault();
    var route_id;
    var form;
    var title;

    route_id = $(this).data('routeId');
    form = $('#edit_route_' + route_id);
    title = $('#route_title_' + route_id);

    if (!$(this).hasClass('Cancel')) {
      $(this).html('Отменить');
      $(this).addClass('Cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('Cancel');
    }

    form.toggle();
    title.toggle();
  })
});
