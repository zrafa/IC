var tts = {};
tts.Synth = window.speechSynthesis;
tts.Voices = [];
tts.Voices = tts.Synth.getVoices(); // get a list of available voices.
tts.DvIndex = 0; //Used to help identify the default tts voice for Chrome or FF on the users platform.
tts.DvRate = 1; // used to set speech rate between 0 and 2, 1 = 'normal'- there are other seemingly optional parameters like pitch, language, volume.
tts.On = true; //Set to false to prevent tts production.
tts.Cancel = true; // Set to true if you want reading to stop with a slide change. Otherwise, all readable text is queued for speech output.
tts.readFrags = false; //Set to true to read fragment text content as it appears.
tts.readNotes = true; //set to true to read text content of any <aside class="notes">text content</aside> tag in a slide section


tts.ReadText = function(txt){
	// Use tts to read text. A new speech synthesis utterance instance is required for each tts output for FF.
	// Chrome lets you redefine the SpeechSynthesizerUtterance.txt property-
	// as needed without having to create a new object every time you want speech.
	//let ttsSpeechChunk = new SpeechSynthesisUtterance(txt);
	var ttsSpeechChunk = new SpeechSynthesisUtterance(txt);
	 ttsSpeechChunk.voice = tts.Voices[tts.DvIndex]; //use default voice -- some voice must be assigned for FF to work.
     ttsSpeechChunk.rate = tts.DvRate; 
     ttsSpeechChunk.lang = "es-US";
     ttsSpeechChunk.pitch = 1;
     tts.Synth.speak(ttsSpeechChunk);	 
};

tts.ReadVisElmts = function(){
	// Uses arguments[0] to denote a DOM element . Then read the innerText of the rest of the list of selectors that are contained in the arguments[0] element.
	// works in Chrome, Opera and FF.
	//let focusElmt = arguments[0];
	var focusElmt = arguments[0];
	
	for (var i=1; i < arguments.length; i++) {
		var xElmts = focusElmt.querySelectorAll(arguments[i]);
		for (var k=0; k < xElmts.length; k++){
			tts.ReadText(xElmts[k].innerText);
		}
	}
	
};


tts.doChunks = function(txt) {
	var ttsSpeechChunk = new SpeechSynthesisUtterance(txt);
	ttsSpeechChunk.voice = tts.Voices[tts.DvIndex];
	ttsSpeechChunk.rate = tts.DvRate; 
	ttsSpeechChunk.lang = "es-US";
	ttsSpeechChunk.pitch = 1;
	

	var timeoutResumeInfinity;

	function resumeInfinity() {
	    tts.Synth.resume();
	    timeoutResumeInfinity = setTimeout(resumeInfinity, 500);
	}

	ttsSpeechChunk.onstart = function(event) {
	    resumeInfinity();
	};

	ttsSpeechChunk.onend = function(event) {
	    clearTimeout(timeoutResumeInfinity);
	};

	//console.log("LEN=",ttsSpeechChunk.text.length,ttsSpeechChunk.text);
	if(ttsSpeechChunk.text === " ") {
	    clearTimeout(timeoutResumeInfinity);
	    return;
	}
	
	tts.Synth.speak(ttsSpeechChunk);	 

}

tts.chunker = function(s, max) { // taken from http://stackoverflow.com/questions/21947730/chrome-speech-synthesis-with-longer-texts
	var chunks = [];
	var l = [];
	l = s.split(/[\.\n]/);  // Split on .,<CR>
	for(var i = 0; i < l.length; i++) {
		var chunk = l[i];
		if(chunk == '') {
			continue;
	  }
	  var siz = chunk.length;
	  if(siz <= max) {
	  	chunks.push(chunk);
	  } else {
	  	while(chunk.length > 0) {
	  		var smallerChunk = tts.subChunker(chunk, max);
	  		chunks.push(smallerChunk);
	  		chunk = chunk.substr(smallerChunk.length);
	  	}
	  }
	}
	return chunks;
}

tts.subChunker = function(s, max) {
	var chunk = s.substr(0, max);
	
	if(chunk.charAt(max) == ' ') {  // Lucky...
		return chunk;
	}
	
	// Start 'rewinding' until a space is found{hopefully}
	for(var i = chunk.length; i > 0; i--) {
		if(chunk.charAt(i) == ' ') {	// Stop!
			return chunk.substr(0, i);
		}
	}
	
	// No space found-- last resort have to cut in mid-word
	return chunk;
}

tts.ReadAnyElmts = function(){
	// Uses arguments[0] to denote a DOM element . Then read the textContent 
	// of the rest of the list of selectors, even hidden ones, that are contained in the arguments[0] element.
	// works in Chrome, Opera and FF.

	var focusElmt = arguments[0];
	var chunks = [];
	for (var i=1; i < arguments.length; i++) {
		var xElmts = focusElmt.querySelectorAll(arguments[i]);
		for (var k=0; k < xElmts.length; k++){
			//console.log('k=',k,'     -->',xElmts[k].textContent);
			//tts.ReadText(xElmts[k].textContent);
			
			chunks = tts.chunker(tts.sanitize(xElmts[k].textContent), 220);
			chunks.forEach(tts.doChunks);
		}
	}
	tts.doChunks('Ya');
	
};

tts.sanitize = function(t) {
/*
	s/\\pi/PI/g;
	s/\\times/ por /g;
	s/\^/ elevado a la /g;
	s/_{\(([^}]+)}/ en base $1/g;
	s/_{([^}]+)}/ sub $1 /g;
	s/_/ sub /g;

	//while(/\D*([01][01]+[01]+)\D* /) { $g = join (' ', split //, $1); s/$1/$g/; }
*/

	t = t.replace(/\\pi/g, " PI ");
	t = t.replace(/\^/g, " elevado a la ");
	t = t.replace(/\\times/g, " por ");
	t = t.replace(/\$/g, "");
	t = t.replace(/-/g, " menos ");
	t = t.replace(/_{\(([^}]+)}/g, " en base $1 ");
	t = t.replace(/_{([^}]+)}/, " sub $1 ");
	t = t.replace(/_/g, " sub ");
	t = t.replace(/\[/g, " .abre corchetes ");
	t = t.replace(/\]/g, " .cierra corchetes ");
	t = t.replace(/:/g, " ");
	t = t.replace(/\.\.\./g, " puntos suspensivos ");
	t = t.replace(/(\S+)\.(\S+)/g, " $1 punto $2 ");
	return t;

};

tts.toggle = function(){
	// turn tts on/off with status announced
	tts.On = !(tts.On);
	console.log("TTS=",tts.On);
	if (tts.On) {
		tts.ReadText("Audio activado")
	} else {
		tts.cancel();
		tts.ReadText("Audio desactivado")
	};
};

tts.cancel = function(){ tts.Synth.cancel(); };



for (var ix = 0; ix < tts.Voices.length; ix++) { 
//find the default voice-- needed for FF, in Chrome voices[0] works as the default.
	if (tts.Voices[ix].default) {
		tts.DvIndex = ix;
	}
};

	
Reveal.addEventListener( 'slidechanged', function( event ) {
	var thisSlide = Reveal.getCurrentSlide();

	if (tts.Cancel) 
		tts.Synth.cancel(); //Stop reading anything still in the speech queue, if tts.Cancel.

	// Read the innerText for the listed elements of current slide after waiting 1 second to allow transitions to conclude.
	// The list of elements is read in the order shown. You can use other selectors like a ".readMe" class to simplify things.
	if (tts.On) {
		//setTimeout(function(){tts.ReadVisElmts(thisSlide,"h1","h2","h3","p","li");}, 1000);
		if (tts.readNotes) setTimeout(function(){tts.ReadAnyElmts(thisSlide,".notes");}, 1000); // Then, conditionally, read hidden notes class.
	}
	} );
	
Reveal.addEventListener( 'fragmentshown', function( event ) {
// This reads the text content of fragments as they are shown.
// event.fragment = the fragment element
	if (tts.readFrags && tts.On){
		var txt = event.fragment.textContent;
		tts.ReadText(txt);
	}
	} );
	
	
Reveal.addEventListener( 'ready', function( event ) {
	// event.currentSlide, event.indexh, event.indexv
	/*Reveal.configure({
	  keyboard: {
		81: function() {tts.cancel()}, // press q to cancel speaking and clear speech queue.
		84: function() {tts.toggle()}  // press t to toggle speech on/off
				 
	  }
	});
	*/
	console.log(Reveal.getConfig().keyboard);

	var thisSlide = Reveal.getCurrentSlide();
	if (tts.On) {
		if (tts.readNotes) setTimeout(function(){tts.ReadAnyElmts(thisSlide,".notes");}, 1000);
	}
} );

