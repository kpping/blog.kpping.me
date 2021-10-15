---
title: "SSH Frozen (ค้าง / หลุด)"
date: 2021-09-29T13:15:20+07:00
draft: false
categories: [geek]
tags: [aws, ec2, ssh, crash, frozen]
---

หลาย ๆ คนที่ใช้ Server ของ AWS (EC2 Instance) อาจจะเจอปัญหา SSH จู่ ๆ ก็ค้างหรือหลุด และ พอเข้าบ่อย ๆ ก็ทำให้ Server เชื่อมต่อไม่ได้เพราะเกินจำนวน Max Connection ต้องเข้าไป Stop-Start Instance กันใหม่ <!--more-->

สาเหตุมันเกิดจาก EC2 โดยปกติหากไม่ไปแก้อะไรมันเลย มันจะ Drop Connection เราทิ้งทุก ๆ 60 วินาที (แล้วแต่ Region; บาง Region ก็ 120 วินาที) หากไม่มีการเคลื่อนไหว

เพราะฉะนั้นสิ่งที่เราจะทำก็คือคอย Ping มันทุก ๆ 50 วินาที ด้วยการเพิ่มคำสั่งนี้เข้าไปใน `~/.ssh/config`

```bash
ServerAliveInterval 50
```

หากใครไม่มี File `~/.ssh/config` นี้ สามารถสร้างได้ด้วยคำสั่ง

```bash
touch ~/.ssh/config
chmod 644 ~/.ssh/config
```

#### ข้อมูลอ้างอิง

[Ref.1](https://stackoverflow.com/questions/7210011/amazon-ec2-ssh-timeout-due-inactivity), [Ref.2](https://unix.stackexchange.com/questions/3026/what-do-options-serveraliveinterval-and-clientaliveinterval-in-sshd-config-d)
