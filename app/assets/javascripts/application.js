//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
$(function(){
  // 画像の高さを毎回計算
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);
  console.log(document.documentElement.style.setProperty('--vh', `${vh}px`));

  $('.scroll').click(function(){
    var speed = 500;
    var position = $(this).parent().next().offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});
