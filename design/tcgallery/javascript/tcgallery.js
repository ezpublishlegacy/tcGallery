$(function(){

var overlayid='site-overlay';
$('<div class="module overlay" id="'+overlayid+'"></div>').prependTo('body');

$('ul.media li a').each(function(){
}).overlay({
	'target':'#'+overlayid,
	'expose':'#333333',
	'onBeforeLoad':function(e){
		var api=this,
			img=new Image();
		var frame = $("<iframe width='100%' height='100%' src='" + this.getTrigger().attr('href') + "'></iframe>")
		this.getOverlay().css({
			'width':'795px',
			'height':'675px'
		}).empty().append(frame).append('<div class="close"></div>')
		.find('.close').click(function(){
			api.close();
		});
	},
	'onClose':function(){
		this.getOverlay().empty();
	}
});

$('body').addClass('with_tcgallery');

});