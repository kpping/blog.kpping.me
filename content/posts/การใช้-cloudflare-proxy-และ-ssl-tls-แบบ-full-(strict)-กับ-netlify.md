---
title: "การใช้ Cloudflare Proxy และ SSL/TLS แบบ Full (strict) กับ Netlify"
date: 2021-03-04T12:10:36+07:00
draft: false
---

การตั้งค่าให้ Cloudflare DNS ชี้มาที่บล็อกนี้ (โฮสต์อยู่บน Netlify) ไม่ยาก แต่หากต้องการใช้ Proxy และ SSL/TLS แบบ Full (strict) ต้องมีการปรับค่าใน Netlify นิดนึง <!--more-->

1. Login เข้าไปที่ Netlify และเลือกเว็บไซต์ที่ต้องการใช้ Proxy และ SSL/TLS จาก Cloudflare

2. ไปที่ *Site settings > Domain management > HTTPS*

3. กด *Install custom certificate* (เปิดหน้าจอค้างไว้ก่อน)

4. Login เข้าไปที่ Cloudflare และเลือกโดเมนที่ใช้กับเว็บไซต์ของเรา

5. ไปที่ *DNS* เลือก Record ที่ชี้ไปเว็บไซต์ที่โฮสต์บน Netlify กด *Edit* แล้วปรับ Proxy Status จาก __DNS only__ เป็น __Proxied__

6. ไปที่ *SSL/TLS > Overview* เลือก Encyption mode เป็น Full (strict)

7. ไปที่ *SSL/TLS > Origin Server* กด *Create Certificate*

8. เลือก *PEM* และคัดลอก __Origin Certificate__ ไปแปะที่ช่อง __Certificate__ บน Netlify

9. คัดลอก __Private Key__ ไปแปะที่ช่อง __Private Key__ บน Netlify

10. ไปที่ *[SHA-256 RSA Certificate Chain (Digicert)](https://crt.sh/?d=2392142934)* และคัดลอกข้อมูลในไฟล์ไปแปะที่ช่อง __Intermediate certs__ บน Netlify

11. กด *Install certificate* เป็นอันเสร็จสิ้น