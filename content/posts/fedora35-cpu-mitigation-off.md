---
title: "ทดลองปิดระบบป้องกัน Spectre และ Meltdown Fedora 35 (mitigations=off)"
date: 2021-11-15T12:17:33+07:00
draft: true
categories: [geek]
tags: [linux, fedora, spectre, meltdown, mitigations]
---

**คำเตือน** ไม่แนะนำให้ทำเพราะทำให้ระบบไม่ปลอดภัย เป็นการเปิดช่องทางให้ Hacker โจมตี

สำหรับใครอยากลองเพิ่มความเร็วให้กับคอมพิวเตอร์โดยการปิดระบบป้องกัน Spectre และ Meltdown บน Fedora 35 สามารถทำได้โดยการเพิ่ม `mitigations=off` ลงไปใน `/etc/sysconfig/grub`

<!--more-->

ทำการ Update ด้วยคำสั่ง `sudo grub2-mkconfig`

จากนั้นให้ Reboot เครื่องเป็นอันเสร็จครับ

ผลการทดสอบสำหรับ `i9-10900KF` ของผมไม่รู้สึกถึงความแตกต่างในการใช้งานทั่วไป และต่างกันไม่มากในการ Compile/Execute Code ครับ (ไม่กี่วินาที) ซึ่งเข้าใจว่ายิ่ง CPU เป็น Gen ใหม่ ๆ จะไม่ค่อยต่าง ([ผลทดสอบตรงกับที่ Blogger ท่านอื่น ๆ เคยทดสอบไว้](https://www.phoronix.com/scan.php?page=article&item=3-years-specmelt&num=1))

## สรุป

สำหรับ `i9-10900KF` คือไม่คุ้มที่จะปิดครับ เพราะแทบไม่รู้สึกในการใช้งานจริง
