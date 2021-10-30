---
title: "ติดตั้ง Hugo บน Ubuntu โดยใช้ Binary"
date: 2021-10-30T11:51:39+07:00
draft: false
categories: [geek]
tags: [gohugo, hugo, ubuntu, install, binary]
---

เมื่อครั้งที่แล้วผมได้แนะนำการ [ติดตั้ง Hugo บน Ubuntu ผ่าน Snap](/posts/install-hugo-on-ubuntu) ไปแล้ว คราวนี้ผมจะมาเขียนวิธีการติดตั้งโดยใช้ Binary กันบ้าง ซึ่งเหมาะกับคนที่ไม่สะดวกใช้ Snap (เช่นบน WSL เป็นต้น)

<!--more-->

```bash
# download binary (https://github.com/gohugoio/hugo/releases)
> curl -OL https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_extended_0.88.1_Linux-64bit.tar.gz

# extract
> tar -xf hugo_extended_0.88.1_Linux-64bit.tar.gz

# move to executable path
> sudo mv hugo /usr/local/bin/

## reload shell ##

# test 1
> which hugo
usr/local/bin/hugo

# test 2
> hugo version
hugo v0.88.1+extended linux/amd64 BuildDate=2021-09-04T13:52:13Z
```
