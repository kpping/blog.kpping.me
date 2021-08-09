---
title: "ติดตั้ง Hugo บน Ubuntu"
date: 2021-08-09T08:45:24+07:00
draft: false
categories: [geek]
tags: [gohugo, hugo, ubuntu, install, snap]
---

สำหรับคนที่สนใจติดตั้ง Hugo บน Ubuntu ผมแนะนำให้ติดตั้งผ่าน Snap นะครับ เพราะเป็นเวอร์ชั่นใหม่, ติดตั้งง่าย, อัพเกรดง่าย, และอยู่ใน Sandbox ของ Snap เอง <!--more-->

การติดตั้งด้วย Snap มีให้เลือก 2 แบบ (ผมใช้แบบที่ 1 เวอร์ชั่น `extended`)

1. `snap install hugo --channel=extended # with Sass/SCSS` และ
2. `snap install hugo # without Sass/SCSS`

หากติดตั้งแบบนึงแล้วอย่างเปลี่ยนไปอีกแบบนึงก็ทำได้ง่าย

1. `snap refresh hugo --channel=extended`
2. `snap refresh hugo --channel=stable`

*ข้อจำกัดของการติดตั้งผ่าน Snap คือตัว Hugo จะไม่สามารถเขียนไฟล์ได้หากโปรเจคไม่ได้อยู่ใน `$HOME` หรือ Directory ที่ผู้ใช้งานไม่ได้เป็นเจ้าของ

{{< ending-thank-you>}}
Happy Coding ครับ
{{< /ending-thank-you >}}
