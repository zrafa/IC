var svg;

var TABLEAU;

var attrs = {
	text: {
		fontSize: '7',
		fontFamily: 'Helvetica',
		textAnchor: 'middle',
		dominantBaseline: 'middle',
		alignmentBaseline: 'middle', 
	},
	box: {
		fill: '#fff',
		stroke: '#000',
		strokeWidth: '0.5', 
	},
	bkg: { 
		fill: '#ccf' 
	},
	null: {
		fill: '#fff',
		stroke: '#fff',
	},
	nullText : {
		fill: '#fff',
	},
	hover: {
		fill: '#6ff',
		stroke: '#000',
		strokeWidth: '0.5',
	},
	wait: {
		fill: '#f66',
		stroke: '#000',
		strokeWidth: '0.5',
	},
	waitText: {
		strokeWidth: '0.5',
	},
	pickText: {
		fontSize: '5',
		fontFamily: 'Helvetica',
		textAnchor: 'middle',
		dominantBaseline: 'middle',
		alignmentBaseline: 'middle',
	},
	pick: {
		fill: '#f88',
	},
};

//var gameover = 'http://vignette1.wikia.nocookie.net/crappy-games/images/1/10/Mljuegos0.png';
var gameover = 'img/gameover.png';

var Idents = 1;
var Ident = function() {
	return Idents++
};
var getRandom = function(min, max) {
	return Math.floor(Math.random() * (max - min) + min);
}


var Bit = function(owner, bitID, value, x, y) {
	this.svg = svg.g(
		svg.rect(x, y, 8, 10, 1).attr(attrs.box),
		svg.text(x + 4, y + 5, value.toString()).attr(attrs.text)
	);
	this.mouseOver = function() {
		this[0].attr(attrs.hover)
	};
	this.mouseOut = function() {
		this[0].attr(attrs.box)
	};
	this.toggle = function() {
		this[1].node.innerHTML = (this[1].node.innerHTML == '1') ? '0' : '1';
		owner.notify(bitID, this[1].node.innerHTML);
	};

	this.enabled = true;
	this.disable = function() {
		this.enabled = false;
		this.svg[0].attr(attrs.null);
		this.svg[1].attr(attrs.nullText);
		this.svg.unclick(this.toggle);
		this.svg.unmouseover(this.mouseOver);
		this.svg.unmouseout(this.mouseOut);
	};
	this.svg.mouseover(this.mouseOver);
	this.svg.mouseout(this.mouseOut);
	this.svg.click(this.toggle);
}

var d2bChallenge = function(id, value) {
	var owner = this;
	this.id = id;
	this.value = value;
	this.Bitword = function(n) {
		this.bits = [];
		this.svg = svg.g();
		for(var bitid = 0; bitid < n; bitid++) {
			this.svg.append(new Bit(this, bitid, 0, bitid * 10, 0).svg);
			this.bits[bitid] = 0;
		}
		this.notify = function(bitid, bitvalue) {
			this.bits[bitid] = bitvalue;
			var value = 0;
			for(var i = 0; i < n; i++)
				value = 2 * value + 1 * this.bits[i];
			owner.notify(value);
		}
	}
	this.notify = function(bitsValue) {
		if(value === bitsValue) {
			owner.svg.blur();
			setTimeout(function() { owner.svg.remove(); }, 1000);
			TABLEAU.removeChallenge(owner.id);
		}
	}
	this.Answer = function(value) {
		this.svg = svg.g(
			svg.rect(0, 0, 15, 10, 1, 1).attr(attrs.box),
			svg.text(8, 5, value.toString()).attr(attrs.text)
		);
	}
	this.bitword = new this.Bitword(value.toString(2).length);
	this.bitword.svg.transform(Snap.format('T{x},0', {
		x: 10 * (7 - value.toString(2).length)
	}));

	this.equal = svg.text(74, 6, '=').attr(attrs.text);

	this.answer = new this.Answer(value);
	this.answer.svg.transform('T80,0');

	this.svg = svg.g(this.bitword.svg, this.equal, this.answer.svg);
	this.svg.data('id', id);
}

var CONFIG = {
	limsup: 4,
	getLimSup: function() { return limsup },
	setLimSup: function(l) { limsup = l },
	timer: 0,
	time: 3000,
	removes: 0,
};

var Tableau = function(height) {
	var background = svg.rect(0, 0, 100, 70, 1, 1).attr(attrs.bkg);
	var score = svg.text(50, 35, '0').attr(attrs.text);
	var t = [height];
	var chg = svg.g();
	for(var i = 0; i < height; i++)
		t[i] = 0;
	var filled = 0;
	score.attr({ opacity: '0.1' });
	score.transform('S5');
	var endgame = function() {
		clearInterval(CONFIG.timer);
		chg.blur();
		var img = svg.image(gameover,10,10,80,50)
			.attr({opacity:'0.0'});
		score.animate({opacity: '1.0', fill: '#000'}, 2000,mina.easeinout,
			function() {
				img.animate({opacity: '1.0'},2000,mina.easeinout,
					function() { setTimeout(newgame, 1000) });
			}
		);
	};
	var addChallenge = function() {
		var i = t.indexOf(0);
		var transf = Snap.format('t0,{y}', {
			y: 12 * (height - filled)
		});
		filled++;
		t[i] = new d2bChallenge(Ident(), getRandom(1, CONFIG.getLimSup()));
		chg.add(t[i].svg);
		t[i].svg.animate({ 'transform': transf }, 1000, mina.bounce);
		scan();
	};
	this.removeChallenge = function(id) {
		for(var i = 0; i < height; i++)
			if(t[i] != 0 && t[i].id === id) {
				t[i] = 0;
			}
		filled--;
		scan();
		CONFIG.removes++;
		score.attr('text', CONFIG.removes);
	};
	var scan = function() {
		for(var i = 0; i < height-1; i++)
			if(t[i] === 0) {
				t[i] = t[i+1];
				t[i+1] = 0;
			}
		for(i = 0; i< height; i++)
		    if(t[i] != 0)
			t[i].svg.animate({
				'transform': Snap.format('t0,{y}',{y: 12 * (height - i)})
			}, 1000, mina.bounce);
	};
	var update = function() {
		if(filled === height)
			endgame();
		else {
			addChallenge();
			if(CONFIG.timer) clearInterval(CONFIG.timer);
			console.log('pre update ',CONFIG.getLimSup());
			if(CONFIG.removes === 2 * CONFIG.getLimSup()) { 
				CONFIG.time = Math.max (CONFIG.time - 200, 0); 
				CONFIG.setLimSup(Math.min (CONFIG.getLimSup() + 4, 255));
			}
			CONFIG.timer = setInterval(update, CONFIG.time);
			console.log('pos update ',CONFIG.getLimSup());
		}
	};
	update();
}

var newgame = function() {
	TABLEAU = 0;
	CONFIG.removes = 0;
	CONFIG.setLimSup(3);
	var again =  svg.g(
		svg.circle(50, 35, 30).attr({fill:'#22f'}), 
		svg.polyline(35,10, 35,60, 77,35).attr({fill:'#fff'})
	).attr({opacity: '0.7'});
	again.click(function(){TABLEAU = new Tableau(5)});
};

var Bingame = function(where) {
	svg = Snap(where);

	Snap.plugin(function(Snap, Element, Paper, global) {
	  Element.prototype.blur = function(callback) {
	    var f = svg.filter(Snap.filter.blur(5, 10));
	    var filterChild = f.node.firstChild;
	    this.attr({
	      filter: f
	    });
	    Snap.animate(0, 10, function(v) {
	      filterChild.attributes[0].value = v + ',' + v;
	    }, 800);
	    setTimeout(callback, 1000);
	  };
	});

	newgame();
};

