function switch_editor() {
  $('#blog_preview').hide();

  $('#blog-content-btn').click(function() {
    if (!($(this).hasClass('current'))) {
      $('#blog-preview-btn').removeClass('current');
      $(this).addClass('current');
      $('#blog_preview').hide();
      $('#blog_content').show();
    }
  });

  $('#blog-preview-btn').click(function() {
    if (!($(this).hasClass('current'))) {
      $('#blog-preview-btn').css('opacity', '0.5');
      $('#blog_content').hide();
      $('#blog-content-btn').removeClass('current');
      $(this).addClass('current');
      $.ajax({
        url: '/blogs/preview',
        type: 'get',
        data: {
          blog: {
            content: $('#blog_content').val()
          }
        }
      }).done((data) => {
        console.log(data);
        $('#blog_preview').show();
      }).fail((data) => {
        console.log(data);
      })
    }
  });
}

$(document).on('turbolinks:load', switch_editor);
