var svg;

var TABLEAU; 
var Waiting; 


var textAttrs = { fontSize: '7', fontFamily: 'Helvetica', textAnchor: 'middle', dominantBaseline: 'middle', alignmentBaseline: 'middle'};
var boxAttrs = { fill: '#fff', stroke: '#000', strokeWidth: '0.5', };
var nullAttrs = { fill: '#fff', stroke: '#fff' };
var nullTextAttrs = { fill: '#fff' };
var hoverAttrs = { fill: '#6ff', stroke: '#000', strokeWidth: '0.5' };
var waitAttrs = { fill: '#f66', stroke: '#000', strokeWidth: '0.5' };
var waitTextAttrs = { strokeWidth: '0.5' };
var pickTextAttrs = { fontSize: '5', fontFamily: 'Helvetica', textAnchor: 'middle', dominantBaseline: 'middle', alignmentBaseline: 'middle'};
var pickAttrs = {fill: '#f88'};


var Idents = 1;
var Ident = function() { return Idents++ };
var getRandom = function(min, max) { return Math.floor(Math.random() * (max - min) + min); }



var ResultBox = function(id,v) {
	this.v = v;
	this.t = '';
	this.setValue = function(v) { this.v = v };
	this.setText = function(t) { this.svg[1] = t };
	this.moveTo = function(x,y) { this.svg.transform(Snap.format('T{x},{y}',{x: x, y: y})); }
	this.value = function() { return this.v };
	var waitForAnswer = function() { 
		if(Waiting.isSet()) return;
		Waiting.set(this);
		console.log(id,Waiting.id);
		this.unclick(waitForAnswer);
		this.click(noAnswer);
		this[0].animate(waitAttrs,1000,mina.bounce);
		//this[1].animate(waitTextAttrs,1000,mina.bounce);
	}
	var noAnswer = function() { 
		this.unclick(noAnswer).click(waitForAnswer);
		Waiting.reSet();
		this[0].attr(hoverAttrs);
		//this[1].attr(textAttrs);
	}
	this.svg = svg.g(
		svg.el('rect').attr({width:15,height:10,rx:1,ry:1}).attr(hoverAttrs),
		svg.el('text').transform('t8,5').attr({text: this.t}).attr(textAttrs)
	).data('v',v).attr({id: id}); 
	console.log('RB: ',this.svg.data('id'));
	this.svg.click(waitForAnswer);
}

		
var Bit = function(owner, bitID, value, x, y) {
	this.svg = svg.g(
		svg.rect(x,y,8,10,1).attr(boxAttrs),
		svg.text(x+4,y+5,value.toString()).attr(textAttrs)
	);
	this.mouseOver = function() { this[0].attr(hoverAttrs) };
	this.mouseOut = function() { this[0].attr(boxAttrs) };
	this.toggle = function() { 
		this[1].node.innerHTML = (this[1].node.innerHTML == '1') ? '0' : '1'; 
		owner.notify(bitID, this[1].node.innerHTML);
	};

	this.enabled = true;
	this.disable = function() { 
		this.enabled = false; 
		this.svg[0].attr(nullAttrs); this.svg[1].attr(nullTextAttrs);
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
			for(var i=0; i < n; i++)
				value = 2 * value + 1 * this.bits[i];
			owner.notify(value);
		}
	}
	this.notify = function(bitsValue) { 
	   if(value === bitsValue) {
		var f = svg.filter(Snap.filter.blur(5, 10));
		var filterChild = f.node.firstChild;
		owner.svg.attr({ filter: f });
		Snap.animate(0, 10, function(v){filterChild.attributes[0].value = v + ',' + v; }, 2000);
		setTimeout(function(){ owner.svg.remove(); },2000);
		TABLEAU.removeChallenge(owner.id);
	   }
	}
	this.Answer = function(value) {
		this.svg = svg.g(
			svg.rect(0,0,15,10,1,1).attr(boxAttrs),
			svg.text(8,5,value.toString()).attr(textAttrs)
		);
	}
	this.bitword = new this.Bitword(value.toString(2).length);
	this.bitword.svg.transform('T0,0');

	this.equal = svg.text(8*8+4,6,'=').attr(textAttrs);

	this.answer = new this.Answer(value);
	this.answer.svg.transform('T85,0');

	this.svg = svg.g(this.bitword.svg, this.equal, this.answer.svg);
	this.svg.data('id', id);
}

var CONFIG = {
	limsup : 32,
	timer : 0,
	time : 5000,
	removes : 0,
	level : function() { this.removes++; if(this.removes > 10) { this.time -= 1000; this.removes = 0; }}
};
	
var Tableau = function(height) {
	var t = [height];
	var map = [height];
	for(var i=0; i<height; i++)
		map[i]=0;
	var filled = 0;
	var removing = false;
	var adding = false;
	var endgame = function() {
		clearInterval(CONFIG.timer);
		console.log('GAMEOVER chau');
	};
	var addChallenge = function() {
		var f = height;
		for(var i=0; i<height; i++)
			if(map[i]===0) f--;
		filled = f;
		var i = map.indexOf(0);
		if(i === -1) console.log('lugar i=',i);
		t[i] = new d2bChallenge(Ident(), getRandom(0, CONFIG.limsup));
		var transf = Snap.format('t0,{y}', {y : 12 * (height - filled) });
		t[i].svg.animate({'transform' : transf}, 500, mina.bounce);
		map[i] = 1;
		filled++;
		console.log('ADD filled ',filled);
	};
	this.removeChallenge = function(id) { 
		for(var i = 0; i < height; i++) {
			if(map[i] != 0 && t[i].id === id) {
				filled--;
				map[i]=0;
				//t[i].svg.remove();
				t[i]=0;
			}
		}
		for(var i = 0; i < height; i++) {
			if(map[i] != 0 &&  t[i].id > id) 
				t[i].svg.animate({'transform': t[i].svg.transform() + 't0,12'}, 100, mina.bounce);
		}
		//CONFIG.level();
		console.log('REM filled ',filled);
	};
	var update = function() {
		if(filled === height)
			console.log('update chau');
		else 
			addChallenge();
	};
	update();
	CONFIG.timer=setInterval(update, CONFIG.time);
}

		
function Bingame() {
	svg = Snap('#bingame');
	svg.rect(0,0,100,70,1,1).attr({fill: '#bbf'});
	TABLEAU = new Tableau(5);
}
