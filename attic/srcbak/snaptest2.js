   var run = function (cont,opt){
	var svg = Snap('#alfa2 svg');
	var rect1 = svg.rect(20, 20, 50, 60, 2);
	rect1.drag();
	console.warn(cont,opt);
   };
