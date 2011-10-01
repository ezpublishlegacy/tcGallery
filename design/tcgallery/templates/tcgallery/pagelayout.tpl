<!DOCTYPE html>

<head>
	<title>Gallery</title>

	<!-- include the Tools -->
	<script src="http://cdn.jquerytools.org/1.2.5/full/jquery.tools.min.js"></script>
	 

	<!-- standalone page styling (can be removed) -->
	<link rel="stylesheet" type="text/css" href="http://static.flowplayer.org/tools/css/standalone.css"/>	


	<link rel="stylesheet" type="text/css" href="http://static.flowplayer.org/tools/css/scrollable-horizontal.css" />
	<link rel="stylesheet" type="text/css" href="http://static.flowplayer.org/tools/css/scrollable-buttons.css" />
	<link rel="stylesheet" type="text/css" href={"stylesheets/tcgallery.box.custom.css"|ezdesign} />
	
	{literal}
	<style>
	
	body {
		padding: 10px 0px!important;
	}
	
	.playerwrap {
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
	
	</style>
	
	<script type='text/javascript'>

	function swapvids(url) {
		$("#playerframe").attr("src", url).load();
		return true;
	}

	</script>
	{/literal}
</head>

<body>
	
{$module_result.content}

</body>

</html>

{kill_debug()}
