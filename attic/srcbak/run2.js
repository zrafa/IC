   var run = function (){
	var svg = Snap('#alfa2 svg');
	var box = function (x,y,t,f) {
		var r = svg.rect(x,y,0,0,1);
		var t1 = svg.text(x,y,t);
		t1.attr({"font-size": f, "font-family": "sans-serif"});
		var b = t1.getBBox();
		r.attr({y: b.y, width: b.w, height: b.h, fill: '#fff'});
		return svg.g(r,t1);
	}
	var rect1 = svg.rect(20, 20, 50, 60, 2);
	rect1.drag();
	//var rect2 = svg.rect(20, 30, 10, 10, 2);
	//b = box(10, 20, "Prueba");
	//b.attr({"font-size": 5, "font-family": "sans-serif"});
	//b.drag();

	rect2 = [ box(20,30,"Prueba 1",5), box(10,50,"Prueba 2",15)];
	rect2[0].drag();
	rect2[1].drag();

	var t0 = 0;
	var t1 = 0;

	rect1.attr({ fill: '#BADA55' });
	var a1 = new Audio('audio/bounce.wav');
	var a2 = new Audio('audio/blop.wav');
	a1.onended=function(){delete a1};
	a2.onended=function(){delete a2};

	var o1 = {opacity: "0.2"};
	var o2 = {opacity: "0.8"};

	var c1 = { fill: '#aaa', stroke: '#000', 
			strokeWidth: 0.2, 
			transform: 'r0, 20, 20'};
	var c2 = { fill: '#222', stroke: '#afa', 
			//strokeWidth: 1, 
			transform: 'r-90, 20, 20'}; 

	//c1 = {transform: 'r0, 20, 20'};
	c2 = {transform: 'r-90, 20, 20'}; 
	rect2[0].hover(function(){
		if(t0) { a1.play() } else { a2.play()}
		rect1.animate( (t0) ?  o1: o2, 500, mina.linear);
		this.animate( (t0) ? c1 : c2, 500, mina.bounce);
		t0 = !t0;
	})
	rect2[1].hover(function(){
		if(t1) { a1.play() } else { a2.play()}
		rect1.animate( (t1) ?  c2: c1, 500, mina.linear);
		this.animate( (t1) ? o2 : o1, 500, mina.bounce);
		t1= !t1;
	})
   };
