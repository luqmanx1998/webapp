//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .


$.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });