---
title: "วิธีการเชื่อม Thunderbird เข้ากับ Google Calendar และ Google Contact"
date: 2021-10-29T22:49:56+07:00
draft: false
categories: [geek]
tags: [thunderbird, google, calendar, contact, sync, ubuntu]
---

สำหรับคนที่ใช้งาน Thunderbird เป็นโปรแกรมสำหรับจัดการอีเมลและปฏิทิน อาจจะเจอปัญหาว่าจะเชื่อมเข้ากับระบบของ Google ยังไง หลังจากหาข้อมูลและลองทดสอบเองแล้ว จึงมาขอจดไว้ในบล็อกนี้

{{< json-figure-picture "/data/posts/thunderbird-google-calendar-google-contact/result.json" >}}

<!--more-->

1. สิ่งแรกที่ต้องติดตั้งหากยังไม่มีคือ `Add-ons` ที่ชื่อว่า `TbSync` และ `Provider for CalDAV & CardDAV` ครับ

2. หลังจากติดตั้งแล้วให้ไปเปิดหน้าจัดการ Config `Preferences` / `General` / `Config Editor...`

3. ค้นหา `extensions.dav4tbsync.googlesupport` และทำการเปลี่ยนจาก `false` เป็น `true`

4. เปิด `TbSync` ขึ้นมา ไปตรง `Account actions / Add new account / CalDAV & CardDAV / Google`

5. กรอกข้อมูลเพื่อล็อกอินจากนั้นก็เลือกว่าจะเชื่อมต่ออะไรบ้างเป็นอันเสร็จครับ

&nbsp;

\*ทดสอบบน Ubuntu 21.04 และ Thunderbird 78.13.0 (64-bit)
