var testItem = {
	x:0, y:0,
	d:0,
	b:0,
	h:0,
	type:0,
	status:0,
};

var t = new testItem();

var GAME = function(svg) {
	var row = function(id, n, x, y, v) {
		var g = svg.g();
		for (var i=0; i<n; i++) {
			g.append(svg.rect(x + (i+1) * 8, y, 8, 10).attr({
				fill: '#fff', stroke: '#444', strokeWidth: '0.5',
				}));
			g.append(svg.text(x+(i+1)*8+4,y+5,v[i]).attr({
				fontSize: '7',
				fontFamily: 'Helvetica',
					textAnchor: 'middle', 
					
