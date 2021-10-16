#!/usr/bin/env bash

ImageName="full-content-rss"

# jpg
for ImageSize in "-1" "100x" "200x" "400x" "768x"; do
    convert ${ImageName}.png -resize ${ImageSize} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB ${ImageName}_q85_r${ImageSize}.jpg
done

# webp
for ImageSize in "-1" "100x" "200x" "400x" "768x"; do
    convert ${ImageName}.png -resize ${ImageSize} -quality 85 ${ImageName}_q85_r${ImageSize}.webp
done

ls
