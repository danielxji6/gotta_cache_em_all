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

  $('#save').click(function() {
    $.ajax({
      method: 'PATCH',
      url: '/users/' + $('#user_id').text(),
      dataType: "html",
      data: {
        team_poke: $('#my_team .switch').data("id"),
        backpack_poke: $('#my_backpack .switch').data("id"),
        empty_position: $('#my_team .switch').data("empty-id")
      },
      success: function(response) {
        console.log("Save!");
        location.reload();
      },
      error: function(error) {
        console.log("ERROR!");
        console.log(error);
        // window.location = '/users/';
      }
    });
  });

});
