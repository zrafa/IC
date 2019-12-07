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
	var fn = function(num,pf) {
		var s = ""; 
		if(pf == 1) {
		for(var i = 0; i < num.length; i++) {
			var p = -(i + 1);
			var t = (i != num.length-1) ? "+ " : "";
			var x = num.toString(2).charAt(i) + 
				"x2<small><sup>" + 
				p.toString() + 
				"</sup></small> " + 
				t;
			s = s + x;
			}
		} else {
		for(var i = num.length-1; i >= 0; i = i-1) {
			var p = num.length - i - 1;
			var t = (i != num.length-1) ? "+ " : "";
			var x = num.toString(2).charAt(i) + 
				"x2<small><sup>" + 
				p.toString() + 
				"</sup></small> " + 
				t;
			s = x + s;
			}
		}
		return s;
	};
	var b = v.toString(2); // 111101 o 111101.001101
	var tfnpe = document.getElementById('texto_tfn_pe');
	var tfnpf = document.getElementById('texto_tfn_pf');
	var dotpos = b.indexOf(".");	
	if(dotpos >= 0) {
		var bpe = b.substr(0,dotpos); // 111101
		var bpf = b.substr(dotpos + 1,b.length); // 111101
		var s1 = fn(bpe,0) + "+";
		var s2 = fn(bpf,1);
		tfnpe.innerHTML = s1; 
		tfnpf.innerHTML = s2; 
	} else {
		if(b != 0) {
			var s = fn(b,0);
			tfnpe.innerHTML = s; 
		} else 
			tfnpe.innerHTML = ""; 
		tfnpf.innerHTML = "";
	}
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
	svg.attr({viewBox: "0 0 200 80"});
	svg.attr({width: "100%", height: "100%"});
	Conector(Lado);
	new Area(Lado,0,0,1);
	var xArea = Lado;
	var yArea = (Lado + 5) * AnchoUnidad;
	new Area(xArea,yArea,0,0);
};
