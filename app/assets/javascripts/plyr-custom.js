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

  var clearPlyr = function(){
    if ($(".plyr").length > 0) {
      $('.plyr__controls').remove();
      $("audio").unwrap();
    };
  };
  
  document.addEventListener("turbolinks:load", clearPlyr);
  document.addEventListener("turbolinks:load", audio );
