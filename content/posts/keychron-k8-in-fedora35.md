---
title: "ทดลองใช้คีย์บอร์ดใหม่ Keychron K8 บน Fedora 35"
date: 2022-05-16T11:37:22+07:00
draft: false
categories: [geek]
tags: [liunx, keychron, keyboard, k8, fedora]
---

คีย์บอร์ดที่ใช้อยู่ Logitech G613 ที่ใช้อยู่ จู่ ๆ ก็รวน กดติดบ้างไม่ติดบ้าง เบิ้ลบ้าง (ซ่อมยากมาก แนะนำลงทุนอีกนิดหาอะไรที่ดีกว่านี้หน่อย) ก็เลยได้ถอยคีย์บอร์ดใหม่ใช้ก่อนกำหนด

Keychron K8 ดูจะเป็นตัวเลือกที่เหมาะสมกับงบที่ตั้งไว้ที่สุด เลยลั่นใน Shopee มาทดลอง

ตัวคีย์บอร์ดถ้าใช้บน Windows หรือ MacOS นั้นไม่ต้องทำอะไรเพิ่ม แต่บน Linux ต้องมีการ Config นิดหน่อย ถึงจะ (1.) ใช้งาน Function Keys ได้ปกติ และ (2.) เชื่อมต่อด้วย Bluetooth ได้อย่างรวดเร็ว ไม่หลุดบ่อย

<!--more-->

1. เลือกโหมด `Win/Android` จากนั้น ปิด `Auto Sleep` บนคีย์บอร์ด (กด `fn + S + O` ประมาณ 3 วินาที จนไฟกระพริบ)

2. ปรับค่า `FastConnectable = true` ในไฟล์ `/etc/bluetooth/main.conf` เพื่อให้เชื่อมต่อ (Pairing) ได้ไวขึ้น

3. รันคำสั่ง `echo "options hid_apple fnmode=2" | sudo tee -a /etc/modprobe.d/hid_apple.conf`

4. รันคำสั่ง `sudo dracut --regenerate-all --force`

5. จากนั้นให้ Restart เพื่อทดลองใช้งาน (หาก Restart แล้วระบบไม่ Pair อัตโนมัติให้ลองกด `fn + 1,2,3` ตามช่องสัญญาที่จับคู่ไว้)

[Ref.1](https://gist.github.com/threeiem/c7d927487ddc219ea3a495bcc057d8e9)
