<?

[ImageMagick]
Filters[]=geometry/scalewidthuponly=-geometry %1<
Filters[]=geometry/fillout=-gravity center -background white -extent 135x100

[AliasSettings]

AliasList[]=tcgallerythumbnail
AliasList[]=tcgallerythumbnail_tall
AliasList[]=tcgallery
AliasList[]=tcgallery_tall
AliasList[]=tcgallery_tallthumbnail

[tcgallerythumbnail]
Filters[]
Filters[]=geometry/scaleheight=100
Filters[]=geometry/scalewidthuponly=150
Filters[]=centerimg=150;100
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallerythumbnail_tall]
Filters[]
Filters[]=geometry/scaleheight=150
Filters[]=geometry/scalewidthuponly=100
Filters[]=centerimg=100;150
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallery_tallthumbnail]
Filters[]
Filters[]=geometry/scaleheight=100
Filters[]=geometry/fillout
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallery]
Filters[]
Filters[]=geometry/scaleheight=385
Filters[]=geometry/scalewidthuponly=682
Filters[]=centerimg=682;385
Filters[]=strip
Filters[]=colorspace=RGB

[tcgallery_tall]
Filters[]
Filters[]=geometry/scaleheight=485
Filters[]=geometry/scalewidthuponly=382
Filters[]=centerimg=382;485
Filters[]=strip
Filters[]=colorspace=RGB

?>