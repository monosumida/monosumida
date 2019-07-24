function switch_editor() {
  //
  // draft
  //
  $('#blog-content-btn').click(function() {
    console.log('draft');
    if (!($('#blog-content-btn').hasClass('current'))) {
      set_post_data();
      $('.blog-content-loading').removeClass('d-none');
      $.ajax({
        url: $('#blog-form').attr('action') + '/draft',
        type: $('#blog-form').attr('method'),
        data: post_data,
        dataType: 'json'
      }).done(function(data, stat, xhr) {
        console.log({ done: stat, data: data, xhr: xhr });
        $('.blog-content-loading').addClass('d-none');
        $('#content-preview').remove();
        $('#blog-content-area').append('<textarea class="form-control blog-content" placeholder="記事を共有しよう" required="required" name="blog[content]" id="blog_content">' + data.content + '</textarea>');
        $('#blog-content-btn').addClass('current');
        $('#blog-preview-btn').removeClass('current');
      }).fail(function(xhr, textStatus, error){
        console.log({ xhr: xhr, textStatus: textStatus, error: error });
      });
    }
  });
  //
  // preview
  //
  $('#blog-preview-btn').click(function() {
    console.log('preview');
    if (!($('#blog-preview-btn').hasClass('current'))) {
      set_post_data();
      $('.blog-content-loading').removeClass('d-none');
      $.ajax({
        url: $('#blog-form').attr('action') + '/preview',
        type: $('#blog-form').attr('method'),
        data: post_data,
        dataType: 'json'
      }).done(function(data, stat, xhr) {
        console.log({ stat: stat, data: data, xhr: xhr });
        $('.blog-content-loading').addClass('d-none');
        $('#blog_content').remove();
        $('#blog-content-area').append('<div id="content-preview">' + data.content + '</div>');
        $('#blog-content-area').append('<input type="hidden" value="'+ data.content +'">' + data.content + '</div>');
        $('#blog-preview-btn').addClass('current');
        $('#blog-content-btn').removeClass('current');
      }).fail(function(xhr, textStatus, error){
        console.log({ xhr: xhr, textStatus: textStatus, error: error });
      });
    }
  });
}

//
// need for request
//
function set_post_data() {
  post_data = {
    blog: {
      title: $('#blog_title').val(),
      content: $('#blog_content').val()
    }
  };
}


$(document).on('turbolinks:load', switch_editor);
