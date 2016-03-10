

var ready_team;
ready_team = function() {
  // to select item in my team
  $('#my_team .poke').click(function() {
    $('#my_team div').removeClass('switch');
    $(this).addClass('switch');
  });
  // to select item in my backpack
  $('#my_backpack .poke').click(function() {
    $('#my_backpack .poke').removeClass('switch');
    $(this).addClass('switch');
  });

  // function to swap my team and my backpack items
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
      }
    });
  });
};

$(document).ready(ready_team);
$(document).on('page:load', ready_team);


$(function() {


});
