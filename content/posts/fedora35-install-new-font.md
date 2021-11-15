---
title: "ติดตั้งฟอนต์ บน Fedora 35"
date: 2021-11-15T20:21:20+07:00
draft: false
categories: [geek]
tags: [fedora, font, ฟอนต์, th-sarabun-new]
---

บน Fedora 35 เราสามารถเพิ่มฟอนต์ได้ง่าย ๆ ผ่าน Command Line (ที่ไม่ทำผ่าน GUI เพราะขี้เกียจโหลดโปรแกรมเพิ่ม และ แบบนี้จัดการได้ง่ายกว่า)

<!--more-->

ตัวอย่างฟอนต์ที่ต้องการติดตั้งเพิ่ม [TH Sarabun New](https://www.f0nt.com/download/sipafonts/THSarabunNew.zip)

```bash
# download
curl -OL https://www.f0nt.com/download/sipafonts/THSarabunNew.zip

# unzip
unzip THSarabunNew.zip -d ./th-sarabun-new/

# move to fedora 35's font location
mkdir -p ~/.local/share/fonts
cp -r th-sarabun-new ~/.local/share/fonts/

# update cache
fc-cache -v
```
