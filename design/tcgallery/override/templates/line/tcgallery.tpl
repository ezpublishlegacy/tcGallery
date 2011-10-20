<!-- tcgalleryline -->

{ezcss_require(array('tcgallery.css'))}
{ezscript_require(array('tcgallery.js'))}
{def $agent = ezservervars()['HTTP_USER_AGENT']}
{if $agent|contains('MSIE')}
	{def $ver = $agent|explode('MSIE')[1]|explode(';')[0]|float()}
	{if $ver|lt(8)}
		{ezcss_require(array('tcgallery.ie.css'))}
	{/if}
{/if}




{* Gallery - Line view *}
{def	$title = ''
	 	$thumb = ''
	 	$src = ''
	 	$v = array()
	    $im_classes = ezini('ClassSettings', 'ImageClasses', 'tcgallery.ini')
		$ims = fetch('content', 'list', hash(	'parent_node_id', $node.node_id,
							'sort_by', $node.sort_array,
							'class_filter_type', 'include',
							'class_filter_array', $im_classes	))
}
<div class="content-view-line">
    <div class="class-tcgallery">

        <h2>{$node.name|wash()}</h2>

    {section show=$node.data_map.image.content}
        <div class="attribute-image">
            {attribute_view_gui image_class=small attribute=$node.data_map.image.content.data_map.image href=$node.url_alias|ezurl}
        </div>
    {/section}

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
        
			<ul class="media wide">
				{foreach $ims as $i}	
					<li>
						{if and(is_set($i.data_map.image), $i.data_map.image.has_content)}
							{set-block scope=relative variable=title}{attribute_view_gui attribute=$i.data_map.caption}{/set-block}
							{set $thumb = $i.data_map.image.content['tcgallerythumbnail'].url|ezroot(no)
								 $src = $i.data_map.image.content['tcgallery'].url|ezroot(no)
							}
						{else}
							{set $v = $i.data_map.video.content.attributes
								 $thumb = $v["thumbnail_medium"]
								 $title = $v['title']
							}
						{/if}
						<a class='gallery_im_link' href="/gallery/album/{$i.node_id}" class="group"  name="omni_photo_gallery" rel="{$node.name|explode(' ')[0]|downcase}" title="{$title}">
							<img width='150px' height='100px' alt='{$title|strip_tags}' title='{$title|strip_tags}' src='{$thumb}'/>
							{if is_set($i.data_map.image)|not}<img width='150px' height='100px' class="video-playbutton" alt="" src={'images/video-space.png'|ezdesign()} />{/if}
							<span class='caption'>{$title|strip_tags|shorten(35)}</span>
						</a>
					</li>
				{/foreach}
			</ul>

        
    </div>
</div>
