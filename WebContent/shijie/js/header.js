document.write(
"<div id=\"header\">"+
	"<ul>"+
		"<li><a href=\"index.html\"><img src=\"img/flower.png\" /></a></li>"+
		"<li><a href=\"introduction.html\"><img src=\"img/flower.png\" /></a></li>"+
		"<li><a href=\"active.html\"><img src=\"img/flower.png\" /></a></li>"+
		"<li><a href=\"workshow.html\"><img src=\"img/flower.png\" /></a></li>"+
		"<li><a href=\"share.html\"><img src=\"img/flower.png\" /></a></li>"+
		"<li><a href=\"message.html\"><img src=\"img/flower.png\" /></a></li>"+
	"</ul>"+
"</div>")
$(document).ready(function(){
    $('#header>ul>li').bind("mouseenter",(function(){
		$(this).find('a>img').css("visibility","visible"); 
    })).mouseleave(function(){
    	$(this).find('a>img').css("visibility","hidden");
    });
})