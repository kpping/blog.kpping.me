---
title: "การใช้ Cloudflare Proxy และ SSL/TLS แบบ Full (strict) กับ Netlify"
date: 2021-03-04T12:10:36+07:00
draft: false
categories: [geek]
tags: [cloudflare, netlify]
---

การตั้งค่าให้ Cloudflare DNS ชี้มาที่บล็อกนี้ (โฮสต์อยู่บน Netlify) ไม่ยาก แต่หากต้องการใช้ Proxy และ SSL/TLS แบบ Full (strict) ต้องมีการปรับค่าใน Netlify นิดนึง <!--more-->

1. Login เข้าไปที่ Netlify และเลือกเว็บไซต์ที่ต้องการใช้ Proxy และ SSL/TLS จาก Cloudflare
2. ไปที่ _Site settings > Domain management > HTTPS_
3. กด _Install custom certificate_ (เปิดหน้าจอค้างไว้ก่อน)
4. Login เข้าไปที่ Cloudflare และเลือกโดเมนที่ใช้กับเว็บไซต์ของเรา
5. ไปที่ _DNS_ เลือก Record ที่ชี้ไปเว็บไซต์ที่โฮสต์บน Netlify กด _Edit_ แล้วปรับ Proxy Status จาก **DNS only** เป็น **Proxied**
6. ไปที่ _SSL/TLS > Overview_ เลือก Encyption mode เป็น Full (strict)
7. ไปที่ _SSL/TLS > Origin Server_ กด _Create Certificate_
8. เลือก _PEM_ และคัดลอก **Origin Certificate** ไปแปะที่ช่อง **Certificate** บน Netlify
9. คัดลอก **Private Key** ไปแปะที่ช่อง **Private Key** บน Netlify
10. ไปที่ _[SHA-256 RSA Certificate Chain (Digicert)](https://crt.sh/?d=2392142934)_ และคัดลอกข้อมูลในไฟล์ไปแปะที่ช่อง **Intermediate certs** บน Netlify
11. กด _Install certificate_ เป็นอันเสร็จสิ้น

&nbsp;

{{< ending-thank-you>}}
Happy Coding ครับ
{{< /ending-thank-you >}}
