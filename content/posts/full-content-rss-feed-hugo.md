---
title: "ทำให้ Hugo โชว์บทความเต็ม ๆ ใน RSS"
date: 2021-10-16T01:01:40+07:00
draft: false
categories: [geek]
tags: [gohugo, hugo, rss, feed, full]
---

โดยปกติแล้ว RSS Template ของ Hugo จะโชว์บทความด้วย `.Summary` ทำให้ข้อมูลไปโชว์ใน RSS ไม่ครบ หลังจากได้ลองค้นจากหลาย ๆ ที่ พบว่าแก้ไข Template เป็นแบบนี้ได้ข้อมูลครบถ้วน และ แสดงผลได้ถูกต้องที่สุด <!--more-->

## ขั้นตอนการทำ

1. สร้างไฟล์ `layouts/rss.xml` ([ตรวจสอบลำดับการอ่านไฟล์](https://gohugo.io/templates/rss/#the-embedded-rssxml)) เพื่อใช้แทน Template เดิม

   ```bash
   touch layouts/rss.xml
   ```

2. คัดลอกข้อมูลจาก [https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/\_default/rss.xml](https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/rss.xml) มาใส่

3. เพิ่ม `xmlns:content` เพื่อให้ Firefox อ่าน XML นี้ได้

   ```xml
   <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
   ```

4. เพิ่ม `content` เพื่อให้ RSS Reader นำไปใช้แทน Description

   ```xml
   <content:encoded>
   {{ `<![CDATA[` | safeHTML }}
       {{ .Content }}
   {{ `]]>` | safeHTML }}
   </content:encoded>
   ```

&nbsp;

## Final Code

[see code](https://gist.github.com/kpping/b4b5fd559555669dc4ff559d4f3e9bb8)

{{< gist kpping b4b5fd559555669dc4ff559d4f3e9bb8 >}}
