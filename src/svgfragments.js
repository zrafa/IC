		function svgfragments(container, options) { 
			var svg = Snap(options.svg);
			var d1 = 500;
			var img;
			var setcount = options.imgset.length;
			var round = 0;

			var showimg = function(n) { 
				if(img) img.attr({opacity: '0.0'});
				img = svg.image(options.imgset[n],0,0,options.width,options.height);
			//.attr({opacity: '1.0'});
			}; 

			Number.prototype.mod = function(n) { return ((this%n)+n)%n; };
			var nextimg = function() { round=(round+1).mod(setcount); showimg(round); };
			var previmg = function() { round=(round-1).mod(setcount); showimg(round); };

			Reveal.addEventListener('fragmentshown', function(event){ 
				var hndlr = event.fragment.getAttribute('data-fragmentshown'); 
				if(hndlr) eval(hndlr)(event.fragment); 
			});
			Reveal.addEventListener('fragmenthidden', function(event){ 
				var hndlr = event.fragment.getAttribute('data-fragmenthidden'); 
				if(hndlr) eval(hndlr)(event.fragment); });

			Reveal.addEventListener('slidechanged', function(event) {
				round = 0;
				showimg(round);
			});
                }
