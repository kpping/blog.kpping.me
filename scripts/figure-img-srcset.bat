set ImageName=order-type-streaming-menu

:: jpg
FOR %%A IN ("-1", "100x", "200x", "400x", "768x") DO (
	convert %ImageName%.jpg -resize %%A -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB %ImageName%_q85_r%%A.jpg
)

:: webp
FOR %%A IN ("-1", "100x", "200x", "400x", "768x") DO (
	magick %ImageName%.jpg -quality 85 -resize %%A %ImageName%_q85_r%%A.webp
)

dir
