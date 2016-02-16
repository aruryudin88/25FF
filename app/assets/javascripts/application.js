// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
  var reset_eye_timeout;
  $('#application_locale').change(function(){
    if(!this.value) return false;
    setCookie('locale', this.value, { expires: 60*60*24*365 });
    document.location.reload();
  });
  $('*').mouseenter(function(event){
    if(event.clientX <= event.clientY){
      var angle = Math.asin(event.clientX/event.clientY)*90/Math.PI;
    }else{
      var angle = Math.acos(event.clientY/event.clientX)*90/Math.PI+45;
    }
    var eyes = $('#eyes');
    var x = eyes.css('left').substr(0, -2), y = 1*eyes.css('top').substr(0, -2);
    x = 12 + Math.sin(angle / 180 * Math.PI) * 3;
    y = 10 + Math.cos(angle / 180 * Math.PI) * 3;
    eyes.css({ left: x, top: y });
    clearTimeout(reset_eye_timeout);
    reset_eye_timeout = setTimeout(function(){ eyes.css({ left: 12, top: 8 }); }, 1000)
  });
});
