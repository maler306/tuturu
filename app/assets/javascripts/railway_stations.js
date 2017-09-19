$(document).ready(function() {
  $('a.edit_station').click(function(event) {
    event.preventDefault();
    var station_id;
    var form;
    var title;

    station_id = $(this).data('stationId');
    form = $('#edit_railway_station_' + station_id);
    title = $('#railway_station_title_' + station_id);

    if (!$(this).hasClass('Cancel')) {
      $(this).html('Отменить');
      $(this).addClass('Cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('Cancel');
    }

    form.toggle();
    title.toggle();

  });
});
