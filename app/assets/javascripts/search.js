$(document).ready(function() {
  $('.search-form').submit(function() {
    var  departure_station;
    var arrival_station;

    departure_station = $(this).find('#departure_station');
    arrival_station = $(this).find('#arrival_station');

    if (departure_station.val() == arrival_station.val()) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});
