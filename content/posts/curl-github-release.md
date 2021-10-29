---
title: "ใช้ cURL โหลดไฟล์จาก GitHub Release"
date: 2021-10-29T23:12:18+07:00
draft: false
categories: [geek]
tags: [curl, github, release]
---

ปกติแล้วการใช้ `curl` เพื่อโหลดไฟล์เราจะใช้คำสั่ง `curl -O <site-name>` ใช่ไหมครับ แต่กรณีเป็นเว็บอย่างเช่น GitHub Release ที่จะ Redirect เราไปที่ไฟล์อีกที ทำให้คำสั่งนี้จะโหลด HTML มาแทนไฟล์ที่เราต้องการ

<!--more-->

```bash
> curl -O https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_extended_0.88.1_Linux-64bit.tar.gz

> cat hugo_extended_0.88.1_Linux-64bit.tar.gz
<html><body>You are being <a href="https://github-releases.githubusercontent.com/11180687/97de8149-76ac-4d1a-8ee9-7c43dd592ea2?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211029%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20211029T161536Z&amp;X-Amz-Expires=300&amp;X-Amz-Signature=9eaf8ada8b9127d57df89ed807eb2da3532980dd342147233b4fedffc9d40284&amp;X-Amz-SignedHeaders=host&amp;actor_id=0&amp;key_id=0&amp;repo_id=11180687&amp;response-content-disposition=attachment%3B%20filename%3Dhugo_extended_0.88.1_Linux-64bit.tar.gz&amp;response-content-type=application%2Foctet-stream">redirected</a>.</body></html>%
```

วิทีแก้คือให้เราเพิ่ม `L` เข้าไปครับ `curl -OL <site-name>`

```bash
> curl -OL https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_extended_0.88.1_Linux-64bit.tar.gz

> tar -xf hugo_extended_0.88.1_Linux-64bit.tar.gz

> ls
hugo  hugo_extended_0.88.1_Linux-64bit.tar.gz  LICENSE  README.md
```
