---
title: "แก้ปัญหาคะแนน PageSpeed Insights ตกเมื่อเปิดใช้ Disqus บน Hugo"
date: 2021-03-05T14:53:18+07:00
draft: false
categories: [ฮาวทู]
tags: [disqus, pagespeed, insights, score, hugo, คะแนน, lazyloading]
---

เมื่อเปิดระบบแสดงความคิดเห็นของ Disqus บน Hugo และใช้ _{{ template "\_internal/disqus.html" . }}_ จะพบว่าคะแนน PageSpeed Insights ตกลงทันที ! เราจะแก้ไขได้อย่างไร มาดูกัน <!--more-->

## ทำไมคะแนนถึงตก

เพราะ [PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) ใช้ความเร็วในการโหลดเว็บไซต์ตั้งแต่ต้นจนจบเป็นหนึ่งในเกณฑ์ให้คะแนน เมื่อเราแปะ Disqus Template เพิ่มเข้าไปทำให้โพสต์เราใช้เวลาโหลดนานขึ้นกว่าจะจบนั่นเอง

## แก้ไขอย่างไร

วิธีแก้ไขอย่างง่ายที่สุดคือ ไม่ต้องโหลด Disqus Template ในตอนแรก แต่ให้โหลดเมื่อเลื่อนจอลงมาถึงจุดที่ต้องการโชว์ Disqus (Lazy Loading)

1. สร้าง Partial Template ขึ้นมาใหม่เพื่อใช้แทนของเดิม

> {{< gist kpping 8c547e3c9d0d7d6c141d68ade5b03e3e >}}

2. แปะโค้ดนี้ลงไป

> {{< gist kpping 60f19bac5a684c9da91b6e991d9605f9 >}}

3. นำ Partial Template นี้ไปใช้แทนของเดิม

> {{< gist kpping c834ddd48d7c944700cb7eafe986f016 >}}

เท่านี้คะแนน PageSpeed Insights ก็จะกลับมาสูงเหมือนเดิม 😎
