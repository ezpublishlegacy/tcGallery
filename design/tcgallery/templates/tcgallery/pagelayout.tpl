<!DOCTYPE html>

<head>
	<title>Gallery</title>

	<!-- include the Tools -->
	<script src="http://cdn.jquerytools.org/1.2.5/full/jquery.tools.min.js"></script>
	 

	<!-- standalone page styling (can be removed) -->
	<link rel="stylesheet" type="text/css" href="/extension/tcgallery/design/tcgallery/stylesheets/standalone.css"/>	


	<link rel="stylesheet" type="text/css" href="/extension/tcgallery/design/tcgallery/stylesheets/scrollable-horizontal.css" />
	<link rel="stylesheet" type="text/css" href="/extension/tcgallery/design/tcgallery/stylesheets/scrollable-buttons.css" />
	<link rel="stylesheet" type="text/css" href={"stylesheets/tcgallery.box.custom.css"|ezdesign} />
	
	{literal}
	<style>
	
	body {
		padding: 10px 0px!important;
	}
	
	#playerwrap {
		margin-left: 40px;
	}
	
	
	.items img {
		cursor: pointer;
	}
	
	.imwrap {
		position: relative;
		float: left;
		display: block;
	}
	
	.scrollable img.video-playbutton {
		position: absolute;
		top: 0px;
		left: 0px;
		background: transparent;
	}
	
	span.caption {
		position: absolute;
		bottom: 4px;
		left: 15px;
		width: 125px;
		text-align: center;
		font-size: 9px;
		height: 12px;
		overflow: hidden;
	}
	
	span.caption p {
		margin: 0px;
		padding: 0px;
	}
	
	#cap_overlay {
		position: absolute;
		top: 465px;
		left: 0px;
		z-index: 1000;
		opacity: .7;
		-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=70)";
		filter: alpha(opacity=70);
		-moz-opacity: 0.7;
		-khtml-opacity: 0.7;
		background: #fff;
		display: block;
		width: 682px;
		font-size: 14px;
		color: black;
	}
	
	#cap_overlay.tcgallery_tall {
		top: 486px;
	}
	
	#cap_overlay p {
		padding: 2px 5px;
		margin: 0px
	}
	
	#playerwrap {
		position: relative;
		overflow: hidden;
		height: 436px;
		margin-bottom: 75px
	}
	
	#playerwrap.tcgallery_tall {
		height: 486px;
		margin-bottom: 25px
	}
	
	</style>
	
	<script type='text/javascript'>
		
	var tcgal_newt = 0;

	function swapvids(url, cap) {
		$("#playerframe").attr("src", url).load();
		diff = (url.indexOf('_tall') > 0) ? 150 : 50;
		if (diff == 150) {
			$("#cap_overlay").attr('className', 'tcgallery_tall');
			$("#playerwrap").attr('className', 'tcgallery_tall');
		} else {
			$("#cap_overlay").attr('className', 'tcgallery');
			$("#playerwrap").attr('className', 'tcgallery');
		}
		$("#cap_overlay").html(cap)
		tcgal_newt = diff + 365 - ($("#cap_overlay").height() - 21);
		return true;
	}
	
	$(function(){
		diff = ($("#cap_overlay").attr('className') == 'tcgallery_tall') ? 150 : 50;
		tcgal_newt = diff + 365 - ($("#cap_overlay").height() - 21);
		$("#playerframe").hover(function(){
			$("#cap_overlay").animate({'top':tcgal_newt}, 700);
		}, function(){
			$("#cap_overlay").animate({'top': diff + 365 + $("#cap_overlay").height() + 21}, 700);
		})
	})

	</script>
	{/literal}
</head>

<body>
	
{$module_result.content}

</body>

</html>

{kill_debug()}
{production_only()}

