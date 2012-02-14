<?

[ImageMagick]
Filters[]=geometry/scalewidthuponly=-geometry %1<

[AliasSettings]

AliasList[]=tcgallerythumbnail
AliasList[]=tcgallery

[tcgallerythumbnail]
Filters[]
Filters[]=geometry/scaleheight=100
Filters[]=geometry/scalewidthuponly=150
Filters[]=centerimg=150;100
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallery]
Filters[]
Filters[]=geometry/scaleheight=385
Filters[]=geometry/scalewidthuponly=682
Filters[]=centerimg=682;385
Filters[]=strip
Filters[]=colorspace=RGB

?>