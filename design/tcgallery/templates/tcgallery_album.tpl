{def $im_classes = ezini('ClassSettings', 'ImageClasses', 'tcgallery.ini')
	 $im1 = fetch(content, node, hash(node_id, $NodeId))
	 $ims = fetch(content, list, hash(parent_node_id, $im1.parent.node_id, sort_by, $im1.parent.sort_array, class_filter_type, 'include', class_filter_array, $im_classes))
	 $start_im = cond(is_set($im1.data_map.video), concat('http://player.vimeo.com/video/', $im1.data_map.video.content.id), $im1.data_map.image.content['tcgallery'].url|ezroot(no))
	 $title = cond(is_set($im1.data_map.video), $im1.data_map.video.content.attributes['title'], $im1.data_map.caption.content.output.output_text)
	 $thumb = ''
	 $src = ''
	 $v = array()
}

<!-- HTML structures -->
<div id='page_wrap'>

<div class='playerwrap'>
<iframe id='playerframe' src="{$start_im}" width="682px" height="386px" frameborder="0" scrolling="no" onload="resizeme(this)"></iframe>
<div id='cap_overlay'>{$title}</div>
</div>

<!-- "previous page" action -->
<a class="prev browse left"></a>

<!-- root element for scrollable -->
<div class="scrollable">   
   
   <!-- root element for the items -->
   <div class="items">
	{foreach $ims as $i}
		{if is_set($i.data_map.image)}
			{set-block scope=relative variable=title}{attribute_view_gui attribute=$i.data_map.caption}{/set-block}
			{set $thumb = $i.data_map.image.content['tcgallerythumbnail'].url|ezroot(no)
				 $src = $i.data_map.image.content['tcgallery'].url|ezroot(no)
			}
		{else}
			{set $v = $i.data_map.video.content.attributes
				 $src = concat('http://player.vimeo.com/video/', $i.data_map.video.content.id)
				 $thumb = $v["thumbnail_medium"]
				 $title = $v['title']
			}
		{/if}
		<span class="imwrap"><img width='135px' height='100px' alt="{$title|strip_tags()}" title="{$title|strip_tags()}" src='{$thumb}' onclick="swapvids('{$src}', '{$title|addslashes()|explode("\r")|implode("")|explode("\n")|implode("")}')"/>{if is_set($i.data_map.image)|not}<img onclick="swapvids('{$src}', '{$title|addslashes()|explode("\r")|implode("")|explode("\n")|implode("")}')" width='135px' height='100px' class="video-playbutton" alt="" src={'images/video-space.png'|ezdesign()} />{/if}
		<span class="caption">{$title|addslashes()|strip_tags()|shorten(20)}</span></span>
	{/foreach}
	</div>
   
</div>

<!-- "next page" action -->
<a class="next browse right"></a>

<br clear="all" />

<!-- javascript coding -->

{literal}

<script>
// execute your scripts when the DOM is ready. this is mostly a good habit
$(function() {

	// initialize scrollable
	$(".scrollable").scrollable();

});

function resizeme(frame){
	body = $('body', frame.contentWindow.document);
	if (frame.contentWindow.document.location.href.indexOf('/gallery/album') !== -1) return false;
	$('body', frame.contentWindow.document).css('margin', '0px').find('img').css({'width' : '100%' , height : '100%'});
}
</script>

{/literal}

</div>