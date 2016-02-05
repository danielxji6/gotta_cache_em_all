var add_admin = function() {
  // TODO: remove unused code -jc
  $('.admin input').on('click', function() {
    /* TODO: remove unused code from production -jc */
    // console.log('Admin checkbox clicked');
    var check = $(this).attr('checked');
    /* TODO: remove debug code from production -jc */
    console.log(check);
  });

};

$(document).ready(add_admin);
