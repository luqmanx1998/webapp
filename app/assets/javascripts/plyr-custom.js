var audio =  function() {
  const controls = `
    <div class="plyr__controls flex">
      <button type="button" class="plyr__control" aria-label="Play, {title}" data-plyr="play">
        <svg class="icon--pressed svg-audio" role="presentation"><use xlink:href="#plyr-pause"></use></svg>
        <svg class="icon--not-pressed svg-audio" role="presentation"><use xlink:href="#plyr-play"></use></svg>
        <span class="label--pressed plyr__tooltip" role="tooltip">Pause</span>
        <span class="label--not-pressed plyr__tooltip" role="tooltip">Play</span>
      </button>
      <div class="plyr__time plyr__time--current" aria-label="Current time">00:00</div>
      <div class="plyr__progress">
        <input data-plyr="seek" type="range" min="0" max="100" step="0.01" value="0" aria-label="Seek">
      </div>
      <div class="plyr__time plyr__time--duration" aria-label="Duration">00:00</div>
    </div>
  `;

  // Setup the player
  

		const players = Plyr.setup('#playerAudio', { controls });


};

  var video = function() {
    const controls = `
    <div class="plyr__controls ">
      <div class="plyr__progress">
          <input data-plyr="seek" type="range" min="0" max="100" step="0.01" value="0" aria-label="Seek">
          <span role="tooltip" class="plyr__tooltip">00:00</span>
      </div>
      <div class="flex flex-center-y flex-space-between">
        <div class="flex flex-center-y">
          <button type="button" class="plyr__control" aria-label="Play, {title}" data-plyr="play">
              <svg class="icon--pressed" role="presentation"><use xlink:href="#plyr-pause"></use></svg>
              <svg class="icon--not-pressed" role="presentation"><use xlink:href="#plyr-play"></use></svg>
              <span class="label--pressed plyr__tooltip" role="tooltip">Pause</span>
              <span class="label--not-pressed plyr__tooltip" role="tooltip">Play</span>
          </button>
          <div class="plyr__time plyr__time--current" aria-label="Current time">00:00</div>
          <div class="plyr__time plyr__time--duration" aria-label="Duration">00:00</div>
        </div>
        <button type="button" class="plyr__control" data-plyr="fullscreen">
            <svg class="icon--pressed" role="presentation"><use xlink:href="#plyr-exit-fullscreen"></use></svg>
            <svg class="icon--not-pressed" role="presentation"><use xlink:href="#plyr-enter-fullscreen"></use></svg>
            <span class="label--pressed plyr__tooltip" role="tooltip">Exit fullscreen</span>
            <span class="label--not-pressed plyr__tooltip" role="tooltip">Enter fullscreen</span>
        </button>
      </div>
    </div>
    `;
  
 
      const players = Plyr.setup('#player', { controls });
  };

  var clearPlyr = function(){
    if ($(".plyr").length > 0) {
      $("video").unwrap();
      $(".plyr__video-wrapper").unwrap();
      $('.plyr__controls').remove();
      $("audio").unwrap();
    };
  };
  
  document.addEventListener("turbolinks:load", clearPlyr);
  document.addEventListener("turbolinks:load", audio );
  document.addEventListener("turbolinks:load", video );
