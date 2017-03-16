   var run = function (cont, opt){
	//var svg = Snap('#alfa1 svg');
	var svg = Snap(cont);
	var rect1 = svg.rect(20, 20, 50, 60, 2);
	rect1.drag();
   };
