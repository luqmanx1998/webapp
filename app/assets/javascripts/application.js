//= require rails-ujs
//= require jquery
//= require dropdown.js
//= require medium-editor.min.js
//= require upload.js
//= require plyr-custom.js
//= require jquery-fileupload/basic
//= require activestorage
//= require turbolinks
//= require_tree .


$.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });