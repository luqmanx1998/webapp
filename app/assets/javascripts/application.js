//= require rails-ujs
//= require jquery
//= require dropdown.js
//= require medium-editor.min.js
//= require upload.js
//= require google_analytics.js.coffee
//= require plyr-custom.js
//= require masonry/imageloaded.pkgd.min.js
//= require masonry/masonry.pkgd.min.js
//= require jquery.atwho
//= require mention.coffee
//= require cable.js
//= require jquery-fileupload/basic
//= require activestorage
//= require turbolinks


$.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });