var add_admin = function() {

  $('.admin input').on('click', function() {
    // console.log('Admin checkbox clicked');
    var check = $(this).attr('checked');
    console.log(check);
  });

};

$(document).ready(add_admin);
