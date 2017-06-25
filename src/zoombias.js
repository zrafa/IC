function ZoomBias(container, options) { 
	var svg = Snap(options.svg);

	Snap.plugin(function(Snap, Element, Paper, global) {
		Element.prototype.zoom = function() {
			var bb = this.getBBox();
			var s = bb.x + ' ' + this.t + ' ' + bb.w + ' ' + bb.h;
	      		this.paper.animate({viewBox : s}, 1000, mina.easeout);
		};
		Element.prototype.restore = function() {
    			this.paper.animate({viewBox : '0 0 100 50'}, 1000, mina.backout);
	    	};
	});

	var bias = Snap.load("img/bias.svg", function(loadedFragment) {
		svg.append(loadedFragment);
	});

	Reveal.addEventListener('fragmentshown',function(event) {
		var inter = event.fragment.getAttribute('data-fragmentshown');
		console.log("SHOWN - INTER ",inter);
		var e = svg.select('#'+ inter);
		console.log(e.getBBox());
		e.hover(e.zoom);
		//e.hover(e.restore);
	});

	Reveal.addEventListener('fragmenthidden',function(event) {
		var inter = event.fragment.getAttribute('data-fragmenthidden');
		console.log("HIDDEN - INTER ",inter);
		var e = svg.select('#'+ inter);
		console.log(e);
		//e.zoom();
		//e.hover(e.restore);
	});

}

