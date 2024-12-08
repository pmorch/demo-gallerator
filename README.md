# Demo of gallerator

## Origin of the media files

### `.jpg' images

The `.jpg` images files come from this [reddit
post](https://www.reddit.com/r/WQHD_Wallpaper/comments/5acl8z/my_1440p_and_4k_nature_wallpapers/)
and in turn from
[imgur](https://imgur.com/a/120-high-quality-nature-images-W9ewQ)

And a few portrait `*.jpg` files from:
https://www.pexels.com/search/nature/


### `.mp4` videos

Come from https://www.pexels.com/search/videos/

## Media post-processing

I have categorized them a little, reduced the file size with help from
[Efficient Image Resizing With ImageMagick — Smashing
Magazine](https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/):


```shell
find -iname '*.jpg' -exec mogrify -filter Triangle -define filter:support=2 \
    -thumbnail 1500 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 \
    -quality 82 -define jpeg:fancy-upsampling=off \
    -define png:compression-filter=5 -define png:compression-level=9 \
    -define png:compression-strategy=1 -define png:exclude-chunk=all \
    -interlace none -colorspace sRGB \
    {} +
```

```
ls -1 | sort -V | tr '\n' '\0' | xargs -0 renumber-files --base image-
```
