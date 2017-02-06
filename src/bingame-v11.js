var svg;

var Tableau; 
var Waiting; 
var Idents = 1;

var Ident = function() { return 'id'+Idents++ };

var textAttrs = { fontSize: '7', fontFamily: 'Helvetica', textAnchor: 'middle', dominantBaseline: 'middle', alignmentBaseline: 'middle'};
var boxAttrs = { fill: '#fff', stroke: '#000', strokeWidth: '0.5', };
var nullAttrs = { fill: '#fff', stroke: '#fff' };
var nullTextAttrs = { fill: '#fff' };
var hoverAttrs = { fill: '#6ff', stroke: '#000', strokeWidth: '0.5' };
var waitAttrs = { fill: '#f66', stroke: '#000', strokeWidth: '0.5' };
var waitTextAttrs = { strokeWidth: '0.5' };
var pickTextAttrs = { fontSize: '5', fontFamily: 'Helvetica', textAnchor: 'middle', dominantBaseline: 'middle', alignmentBaseline: 'middle'};
var pickAttrs = {fill: '#f88'};

var getRandom = function(min, max) { return Math.floor(Math.random() * (max - min) + min); }

var Challenge = function(id, pos, type, value) {
	this.t = 0;
	this.v = value; 
	if(this.t == 0) { // b2d
		this.b = this.v.toString(2);
		this.b = Array(11 - this.b.length).join('0') + this.b;
		this.bits = [];
		this.bitword = svg.g();
		var skip = true;
		this.svg = svg.g().attr({id: Ident()});
	console.log('CH: ',this.svg.attr('id'));
		for(var i = 10 - this.b.length; i < 10; i++) {
			var bit = new Bit(this.b[i], i*8, pos*12+1);
			if(bit.v === '1') skip = false;
			if(skip) bit.disable();
			this.bits[i] = bit;
			this.bitword.append(bit.svg);
		}
		this.eq = svg.text(10*8+4,pos*12+6,'=').attr(textAttrs);
		var rb = new resultBox(this.svg.attr('id'),this.v); // rb.svg's id == this.svg.id for deletion
		rb.setText('');
		rb.moveTo(11 * 8, pos * 12 + 1);
		this.resultBox = rb;
		this.svg.append(this.bitword, this.eq, this.resultBox.svg);
		this.value = function() { return this.v };
		
	} else { // d2b
	}	
}

var WaitingChallenge = function() {
	if(Waiting) return;
	this.waiting = false;
	this.resBox = '';
	this.isSet = function() { return this.waiting };
	this.reSet = function() { this.resBox = ''; this.waiting = false };
	this.set = function(resBox) { this.resBox=resBox; this.waiting = true};
	this.value = function() { if(this.waiting) return this.resBox.data('v'); else return -1 };
	this.satisfy = function() { Tableau.delete(this.resBox.attr('id')) };
};
var resultBox = function(id,v) {
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
		
var Bit = function(value, x, y) {
	this.v = value;
	this.x = x;
	this.y = y;
	this.svg = svg.g(
		svg.rect(x,y,8,10,1).attr(boxAttrs),
		svg.text(x+4,y+5,this.v).attr(textAttrs)
	);
	this.mouseOver = function() { this[0].attr(hoverAttrs) };
	this.mouseOut = function() { this[0].attr(boxAttrs) };
	this.toggle = function() { this[1].node.innerHTML = 
		(this[1].node.innerHTML == '1') ? '0' : '1'; };
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





var pickPicked = function() {
	if(! Waiting.isSet()) return;
	console.log(this.data('v'));
	if(this.data('v') === Waiting.value()) {
		this.unclick(pickPicked);
		// transportar pick sobre Waiting
		var transf = Snap.format('t{x},{y}',
			{x: Waiting.x-this.data('x') + 5, 
			 y: Waiting.y-this.data('y') + 5});
		this.transform('');
		this.animate({'transform': transf, 'opacity': '0.5'}, 500, mina.easein);
		Waiting.satisfy();
	}
};


//desacoplar gen de show para dejar z de picks delante de resbox
var PickSet = function(n,m) {
	this.picks = [n];
	for(var i=0; i<n; i++) {
		this.picks[i] = getRandom(1,m);
	}
	this.pickAPick = function(){ return this.picks[getRandom(1,n)] };
};

var showPicks = function(n,pickset) {
	this.svg = svg.g();
	for(var i=0; i<n; i++) { //should be shortened
		var x = 14 * 8 + 12 * (i % 2);
		var y = 6  + 12 * Math.floor(i % n) / 2;
		this.svg.append(new Pick(pickset.picks[i],x,y).svg);
	}
};
	
var Pick = function(v, x, y) {
	this.svg = svg.g(
		svg.circle(x, y, 5).attr(pickAttrs),
		svg.text(x, y, v.toString()).attr(pickTextAttrs)
	).data('v',v).data('x',x).data('y',y);	
	this.svg.click(pickPicked);
}

var tableau = function(m,n) {
	this.tableau = [m];	
	console.log('TABLEAU: ', this.tableau);
	Waiting = new WaitingChallenge();
	this.id = 1;	
	this.pickSet = new PickSet(n,49);
	for(var i = 0; i < m; i++) {
		var challenge = new Challenge(this.id, i, type=0, this.pickSet.pickAPick());	
		svg.append(challenge.svg);
		this.tableau[i]=challenge; 
	}
	showPicks(n,this.pickSet);
	this.delete = function(id) { var sel='#'+id.toString(); var a = svg.select(sel); console.log('deleting ',id, a)};
}
	
var Bingame = function() {
	console.log('v.11');
	svg = Snap('#bingame');
	Tableau = new tableau(5,8);
}

