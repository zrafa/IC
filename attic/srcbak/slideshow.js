
var Slideshow = function(args) {

	var svg = Snap('#slideshow');
	var imgs = [];
	for(var i=0; i<args.length; i++) {
		imgs[i] = svg.image(args[i],0,0,100,200);
	}

	var showimg = function(id) { 
		var d1 = 2500;
		imgs[id].animate({opacity: '1.0'},d1);
		svg.animate({viewBox: imgs[id].getBBox().vb},d1,mina.backin); 
	}; 


	Reveal.addEventListener('fragmentshown',function(event){ eval(event.fragment.getAttribute('data-fragmentshown'))(event.fragment.id); });
	Reveal.addEventListener('fragmenthidden',function(event){ eval(event.fragment.getAttribute('data-fragmenthidden'))(event.fragment.id); });
}

	

