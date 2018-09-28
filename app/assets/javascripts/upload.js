document.addEventListener("turbolinks:load", function() {
  $(function() {
   function readURL(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function (e) {
         $('#image-prev').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
     }
   }

   $("#image-upload").change(function(){
     $('#image-prev').removeClass('hidden');
     $('#image-img').addClass('hidden');
     $('#upload-wrapper').addClass('hidden');
     readURL(this);
   });
  });

  $(function() {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
          $('#playerAudio').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
 
    $("#audio-upload").change(function(){
      $('.audio-preview').removeClass('hidden');
      $('#upload-wrapper').addClass('hidden');
      readURL(this);
    });
   });

   $(function() {
    $("#video-upload").change(function(){
      $('.video-ready').removeClass('hidden');
      $('#upload-wrapper').addClass('hidden');
      readURL(this);
    });
   });

})
