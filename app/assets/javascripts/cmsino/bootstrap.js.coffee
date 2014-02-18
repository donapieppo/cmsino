//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ../wysihtml5/wysihtml5-0.3.0.min.js
//= require ../wysihtml5/bootstrap-wysihtml5.js

jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
