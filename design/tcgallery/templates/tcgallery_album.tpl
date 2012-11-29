{def $im_classes = ezini('ClassSettings', 'ImageClasses', 'tcgallery.ini')
	 $im1 = fetch(content, node, hash(node_id, $NodeId))
	 $im_al = cond($im1.data_map.image.content.original.height|gt($im1.data_map.image.content.original.width), 'tcgallery_tall', 'tcgallery')
	 $ims = fetch(content, list, hash(parent_node_id, $im1.parent.node_id, sort_by, $im1.parent.sort_array, class_filter_type, 'include', class_filter_array, $im_classes))
	 $start_im = cond(is_set($im1.data_map.video), concat('http://player.vimeo.com/video/', $im1.data_map.video.content.id), $im1.data_map.image.content[$im_al].url|ezroot(no))
	 $title = cond(is_set($im1.data_map.video), $im1.data_map.video.content.attributes['title'], $im1.data_map.caption.content.output.output_text)
	 $thumb = ''
	 $src = ''
	 $v = array()
}

<!-- HTML structures -->
<div id='page_wrap'>

<div id='playerwrap' class='{$im_al}'>
<iframe id='playerframe' src="{$start_im}" width="682px" height="486px" frameborder="0" scrolling="no" onload="resizeme(this)"></iframe>
<div class='{$im_al}' id='cap_overlay'>{$title}</div>
</div>

<!-- "previous page" action -->
<a class="prev browse left"></a>

<!-- root element for scrollable -->
<div class="scrollable">   
   
   <!-- root element for the items -->
   <div class="items">
	{foreach $ims as $i}
		{if is_set($i.data_map.image)}
			{set $im_al = cond($i.data_map.image.content.original.height|gt($i.data_map.image.content.original.width), 'tcgallery_tall', 'tcgallery')}
			{set-block scope=relative variable=title}{attribute_view_gui attribute=$i.data_map.caption}{/set-block}
			{set $thumb = $i.data_map.image.content[concat($im_al, 'thumbnail')].url|ezroot(no)
				 $src = $i.data_map.image.content[$im_al].url|ezroot(no)
			}
		{else}
			{set $v = $i.data_map.video.content.attributes
				 $src = concat('http://player.vimeo.com/video/', $i.data_map.video.content.id)
				 $thumb = $v["thumbnail_medium"]
				 $title = $v['title']
			}
		{/if}
		<span class="imwrap"><img width='135px' height='100px' alt="{$title|strip_tags()}" title="{$title|strip_tags()}" src='{$thumb}' onclick="swapvids('{$src}', '{$title|addslashes()|explode("\r")|implode("")|explode("\n")|implode("")}')"/>{if is_set($i.data_map.image)|not}<img onclick="swapvids('{$src}', '{$title|addslashes()|explode("\r")|implode("")|explode("\n")|implode("")}')" width='135px' height='100px' class="video-playbutton" alt="" src={'images/video-space.png'|ezdesign()} />{/if}
		<span class="caption">{$title|strip_tags()|htmlspecialchars|shorten(20)}</span></span>
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
	is_tall = 
	$('body', frame.contentWindow.document).css('margin', '0px').find('img').each(function(){
		if ($(this).attr('src').indexOf('_tall') > 0) {
			$(this).css({'width' : '382px' , 'height' : '485px', 'padding-left': '150px'});
		} else {
			$(this).css({'width' : '682px' , 'height' : '386px', 'padding-top': '50px'});
		}
		
	});
}
</script>

{/literal}

</div>