---
title: "VirtualBox ไม่เจอ USB บน Ubuntu"
date: 2021-10-07T14:30:20+07:00
draft: false
categories: [geek]
tags: [oracle, vm, virtualbox, usb, ubuntu, linux]
---

วิธีแก้ปัญหาสำหรับคนที่ใช้ VirtualBox บน Linux Host แล้วมีปัญหา VirtualBox หา USB Devices ไม่เจอ วิธีแก้คือให้ทำการเพิ่ม User เข้า `vboxusers` Group <!--more-->

```bash
sudo adduser $USER vboxusers
```

จากนั้นให้ Logout - Login ใหม่ (หรือ Restart)

#### ข้อมูลอ้างอิง

[Ref.1](https://superuser.com/questions/956622/no-usb-devices-available-in-virtualbox), [Ref.2](https://help.ubuntu.com/community/VirtualBox/USB)
