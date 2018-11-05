$(function(){
  $('#new_comment input[type="submit"]').on('click', function(e){
    e.preventDefault();
    var comment_content = $('#comment_content').val();
    var book_id = $('#comment_book_id').val();
    data = {"comment": {"content": comment_content, "book_id": book_id}}
    $.ajax({
      method: 'POST',
      url: '/books/' + book_id + '/comments',
      type: 'JSON',
      data: data
    }).success(function(data){
      $('.all-comment').prepend(data.content);
      $('#comment_content').val("");
    }).error(function(){
      alert(I18n.t("comments.form.alert"));
    });
  });
});
