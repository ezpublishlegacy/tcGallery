<?

[ImageMagick]
Filters[]=geometry/scalewidthuponly=-geometry %1<

[AliasSettings]

AliasList[]=tcgallerythumbnail
AliasList[]=tcgallery

[tcgallerythumbnail]
Filters[]
Filters[]=geometry/scaleheight=100
Filters[]=geometry/scalewidthuponly=155
Filters[]=centerimg=135;100
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallery]
Filters[]
Filters[]=geometry/scaleheight=500
Filters[]=geometry/scalewidthuponly=682
Filters[]=centerimg=682;500
Filters[]=strip
Filters[]=colorspace=RGB

?>