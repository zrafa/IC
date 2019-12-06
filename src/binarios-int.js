var svg;

var Unidad = 5;
var AnchoUnidad = Unidad;
var AltoUnidad = Unidad;
var Lado = 16;

var plainAttr = { fill: '#fff', stroke: '#888', strokeWidth: '0.5', };
var selectedAttr = { fill: '#22f', stroke: '#333', strokeWidth: '0.5', };
var plainShadeAttr = { fill: '#ccd', stroke: '#777', strokeWidth: '0.5', };
var selectedShadeAttr = { fill: '#88f', stroke: '#777', strokeWidth: '0.5', };

var valor = 0;

var writeval = function(v) {
	var tfn = document.getElementById('texto_tfn');
	var s = "";
	var b = v.toString(2);
	for(var i = b.length-1; i >= 0; i = i-1) {
		var p = b.length - 1 - i;
		var t = (i != b.length-1) ? "+ " : "";
		s = v.toString(2).charAt(i) + 
			" x 2<small><sup>" + 
			p.toString() + "</sup></small> " + t + s;
	}
	tfn.innerHTML = s;
	var bin = document.getElementById('texto_binario');
	bin.innerHTML = v.toString(2); 
	var dec = document.getElementById('texto_decimal');
	dec.innerHTML = v.toString();
};

var Potencia = function(posx,posy,ancho,alto,peso) {
	this.g = svg.g();
	this.g.peso = peso;
	if(this.g.peso >= 1) {
		for(var j=0; j<ancho; j++) 
			for(var i=0; i<alto; i++) 
				this.g.add(svg.rect(
					posx + j * AnchoUnidad,
					posy + i * AltoUnidad,
					AnchoUnidad, AltoUnidad, 0));
	} else {
		this.g.add(svg.rect(
			posx, posy,
			ancho * AnchoUnidad, alto * AltoUnidad, 
			0));
	}
	var shade = function () { 
		this.attr(this.selected ? 
			selectedShadeAttr : plainShadeAttr);
	};
	var unshade = function () { 
		this.attr(this.selected ? selectedAttr : plainAttr);
	};
	var toggle = function () {
		this.attr(this.selected ? plainAttr : selectedAttr);
		valor = valor + this.peso * (this.selected ? -1 : 1);
		writeval(valor);
		this.selected = ! this.selected;
	};
	var d = this.g.peso;
	var b = this.g.peso.toString(2);
	this.g.append(Snap.parse(`<title>${d} = ${b}</title>`));
	this.g.hover(shade, unshade);
	this.g.click(toggle);
	this.g.attr(plainAttr);
	return this.g;
};

var fpeso = function(size,v,entero) {
	return (entero ? v : v / (size * size));
};

var Area = function (size,offsx,offsy,entero) {
	this.g = svg.g();
	var x = 0;
	var y = 0;
	var p1, p2;
	for(var i=size; i>1; i=i/2) {
		this.g.add(
		new Potencia(offsx+x*AnchoUnidad,
			offsy+0,i/2,i,
			fpeso(size,i*i/2,entero)),
		new Potencia(offsx+(x+i/2)*AnchoUnidad,
			offsy+(i/2)*AltoUnidad,i/2,i/2,
			fpeso(size,i*i/4,entero))
		);
		x = x + i/2; 
	}
};

var Conector = function(size) {
	var x1 = (size - 1)* AnchoUnidad; 
	var x2 = x1 + 6 * AnchoUnidad;
	var y3 = size * AltoUnidad;
	var x4 = size * AnchoUnidad;
	var y4 = AltoUnidad;

	var g = svg.gradient("L(0, 0, 100, 100)#000-#489:25-#fff");
	var p = svg.path(`M${x1},0H${x2}V${y3}L${x4},${y4}H${x1}V0`).attr({
		fill: g,
		strokeWidth: 0
	});
};

var binarios = function(where) {
	svg = Snap(where);
	svg.attr({viewBox: "-20 -10 100 100"});
	//svg.attr({width: "100%", height: "50%"});
	new Area(Lado,0,0,1);
};
