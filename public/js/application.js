$(document).ready(function() {

  $('#new-location').on('submit',function(e){
    e.preventDefault();
    var $target = $(e.target);
    $('#new-location').hide(500);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
    }).done(function(response){
      $('#new-location-form').show(500);
    });
  });

  $('#new-location-form').on('submit', 'form', function(e){
    e.preventDefault();
    var $target = $(e.target);
    $('#new-location-form').hide(500);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
      $('#new-location').show(500);
      $('.locations').append(response).show(500);
      $('#new-location-form').hide(500);
      $('#new-location-form')[0].reset();
    });
  });

  $('.locations').on('click', 'a.edit-delete', function(e){
    e.preventDefault();
    $(".edit-delete-span").hide(500);
    $(".query-button").hide(500);
    var $target = $(e.target);
    $target.closest('.location').find('.edit-delete-form-div').show(500);
  });

  $('.locations').on('click', 'a.cancel', function(e){
    e.preventDefault();
    $(".edit-delete-span").show(500);
    $(".query-button").show(500);
    var $target = $(e.target);
    $target.closest('.location').find('.edit-delete-form-div').hide(500);
  });

  $('.locations').on('submit', '.query-button', function(e){
    e.preventDefault();
    var $target = $(e.target);
    $('.query-result').hide(500);
    $('.query-button').show(500);
    $target.closest('.query-button').hide(500);
    // $('.query-result').hide(500);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){

      $target.closest('.location')
        .find('.query-result')
        .delay( 500)
        .show(500);
    });
  });
});
