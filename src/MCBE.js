var MCBE = function (svg) {
	var Byte = function(id, x, y, v) { 
		var g = svg.g();
		for (var i = 0; i < 8; i++) { 
			g.append(svg.rect(x + (i + 1) * 8, y, 8, 10).attr({ 
				fill: '#fff', stroke: '#000', strokeWidth: '0.5', 
			})); 
			g.append(svg.text(x + (i + 1) * 8  + 4, y + 5, v[i]).attr({ 
				fontSize: '7', 
				fontFamily: 'Helvetica', 
				textAnchor: 'middle', 
				dominantBaseline: 'middle', 
				alignmentBaseline: 'middle', 
			})); 
		}; 
		g.append(svg.text(x, y + 5, (id == '') ? '0' : id).attr({
				fontSize: '7', 
				fontFamily: 'Helvetica', 
				textAnchor: 'middle', 
				dominantBaseline: 'middle', 
				alignmentBaseline: 'middle', 
			}));
		g.attr({id: id});
		return g;
	};

	var ucbox = svg.g(
		svg.rect(0,0,172,14,2).attr({fill: '#faa'}),
		svg.g(Byte('PC',7,2,'00000000'), Byte('IR',97,2,'00000000')).attr({id: 'uc'})
	);	
	var alubox = svg.g(
		svg.rect(180,0,82,14,2).attr({fill: '#aca'}),	
		Byte('Ac',187,2,'00000000').attr({id: 'alu'})
	);

	var mem = svg.g().attr({id: 'mem'});
	for (var k = 0; k < 4; k++) {
		for (var j = 0; j < 8; j++) { 
			mem.append(Byte(j + 8 * k,90*k+7, 20+10 * j, '00100110')); 
		}
	}
	var membox = svg.g( svg.rect(0,18,352,84,2).attr({fill: '#aac'}), mem);
}
