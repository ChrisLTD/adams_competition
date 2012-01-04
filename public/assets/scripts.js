$(function(){

  $('.upload .edit').hide();
  $('.upload .current').after('<button class="edit_btn">Edit</button>');

  $('.edit_btn').click(function(e) {
    e.preventDefault();
    $(this).nextAll('.edit').slideDown();
    $(this).hide();
  });


  $('#show_IDs').click(function(e) {
    e.preventDefault();
    $('.id').toggle();
  });

});