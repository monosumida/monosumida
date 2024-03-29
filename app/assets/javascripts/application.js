//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  // 画像の高さを毎回計算
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);

  var _bownow_ts = document.createElement('script');
  _bownow_ts.charset = 'utf-8';
  _bownow_ts.src = 'https://dev3-contents.bownow.jp/js/UTC_0945ef01f22594920537/trace.js';
  document.getElementsByTagName('head')[0].appendChild(_bownow_ts);

  $('.scroll').click(function() {
    var speed = 500;
    var position = $(this).parent().next().offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });

  // ページを離れる時の警告を出す
  $(window).on('beforeunload', function(e) {
    if($('#form-target').length) {
      return "このページを離れますか？";
    }
  });

  $('input[type=submit]').on('click', function(e) {
    $(window).off('beforeunload');
  });

  // ハンバーガーメニューの表示
  $('#hamburger').on('click', function() {
    $(this).toggleClass('close');
    $('.global-nav').toggleClass('visible');
  });
});
