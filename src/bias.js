function Bias(container, options) { 
	var svg = Snap(options.svg);

	var attrs = {
		line: {stroke: '#000', strokeWidth: '0.2'},
		text: {
			fontSize: '2',
			fontFamily: 'Helvetica',
			textAnchor: 'middle',
			dominantBaseline: 'middle',
			alignmentBaseline: 'middle',
		},
		inter: {
			fontSize: '2',
			fontFamily: 'Helvetica',
			textAnchor: 'middle',
			dominantBaseline: 'middle',
			alignmentBaseline: 'middle',
			stroke: '#22f',
			strokeWidth: '0.3',
			opacity: '0.5'
		},
	};

	var recta = function(li,ls,a,b,t,k) {
		this.g = svg.g( svg.line(0,5,options.width,5).attr(attrs.line) );

		// Marcas
		var marquita = function(x, num) { 
			return (num === 0) ? 
				svg.g( svg.line(x,2,x,7).attr(attrs.line), svg.text(x,9, num.toString()).attr(attrs.text)) : 
				svg.g( svg.line(x,4,x,6).attr(attrs.line), svg.text(x,9, num.toString()).attr(attrs.text))
		};
		var step = ls - li + 1; 
		var traslacion = function(x) { return options.width * (x - li) / step + 2 };

		for(var i=li; i<=ls; i++) {
			this.g.add(marquita(traslacion(i), i));
		}
	
		// Intervalo
		this.inter = svg.g();
		this.inter.attr({id: 'inter'});
		this.inter.t = t;

		this.inter.add (
			svg.text(traslacion(a),4,"[").attr(attrs.inter).transform('S3'),
			svg.text(traslacion(b),4,"]").attr(attrs.inter).transform('S3')
		);

		// Binarios
		var secuencia = function(n, k) { return ("000000000000000" + n.toString(2)).substr(-k); };
		for(var i=0; i<b-a+1; i++) 
			this.inter.add(svg.text(traslacion(a + i),0,secuencia(i,k)).attr(attrs.text).transform('S0.4'));

		this.g.add(this.inter);
		//X

		return this;
	}

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

	var r1 = recta(-5,28,10,25,10,4);
	r1.g.transform('T0 '+10); // estaba en X
	var inter1 = r1.g.select('#inter');
	inter1.click(inter1.zoom);
	inter1.hover(inter1.restore);

	var r2 = recta(-5,28,-3,4,30,3);
	r2.g.transform('T0 '+30);
	var inter2 = r2.g.select('#inter');
	inter2.click(inter2.zoom);
	inter2.hover(inter2.restore);

}

