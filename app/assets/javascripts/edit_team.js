console.log("Load!");

$(function() {

  $('#my_team .poke').click(function() {
    $('#my_team div').removeClass('switch');
    $(this).addClass('switch');
  });

  $('#my_backpack .poke').click(function() {
    $('#my_backpack .poke').removeClass('switch');
    $(this).addClass('switch');
  });

  

});
