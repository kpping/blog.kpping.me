---
title: "เปลี่ยนมาใช้ SSH แทน HTTPS บน GitHub"
date: 2021-03-25T16:35:59+07:00
draft: false
categories: [ฮาวทู]
tags: [git, github, ssh, https]
---

GitHub จะ[ยกเลิกการยืนยันตัวตนผ่าน HTTPS](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/) (ที่ต้องใส่ Username และ Password) สำหรับ Git Client ในวันที่ 31 สิงหาคม 2021 นี้ เราเลยต้องมาทะยอยเปลี่ยน Repository Remote's URL กัน (เยอะซะด้วย 😭) เพื่อที่จะได้ไม่ต้องไปค้นหาวิธีใน Google บ่อย ๆ เลยขอจดไว้ในบล็อกนี้แทน <!--more-->

## 1. สร้าง SSH Key ในเครื่องของเรา

วิธีการสร้างก็จะต่างกันไปตามแต่ละ OS ที่ใช้งาน อย่างของผมเป็น Ubuntu ก็จะใช้คำสั่ง `ssh-keygen -t ed25519 -C "your_email@example.com"`

หาก OS แตกต่างจากผมสามารถเข้าไปดูเพิ่มเติมได้ [จากในเว็บ](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) นะครับ

ผมแนะนำให้ตั้งชื่อไฟล์เป็น github (`/home/kpping/.ssh/github`) หรืออื่น ๆ ตามความเหมาะสมแทนค่าเริ่มต้น id_ed25519 (`/home/kpping/.ssh/id_ed25519`) เพื่อการจัดการที่ง่ายกว่าครับผม

จากนั้นให้เพิ่ม SSH Key ตัวนี้เข้าไปใน `ssh-agent` ครับผม

```
➜ eval `ssh-agent -s`
Agent pid 20833

➜ ssh-add ~/.ssh/github
Identity added: /home/kpping/.ssh/github (your_email@example.com)
```

## 2. นำ SSH Key ไปแปะบนบัญชี GitHub ของเรา

บนเว็บ GitHub ให้เข้าไปที่ `คลิกรูปโปรไฟล์ขวาบน => Settings => SSH and GPG keys => New SSH key`

ตั้งชื่อที่ต้องการในช่อง `Title` (โดยปกติเราจะใช้ชื่อเครื่องของเราเพื่อที่จะได้จัดการง่ายครับ)

ในช่อง `Key` ให้เอาข้อมูลใน `/home/kpping/.ssh/github.pub` มาใส่

กด `Add SSH key` เพื่อบันทึกแล้วมาลองทดสอบกันด้วยคำสั่ง `ssh -T git@github.com`

```
➜ ssh -T git@github.com
The authenticity of host 'github.com (13.229.188.59)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,13.229.188.59' (RSA) to the list of known hosts.
Hi kpping! You've successfully authenticated, but GitHub does not provide shell access.

```

หากได้ Response ตามข้างบนแสดงว่าเราสามารถใช้ SSH Key ตัวนี้ได้แล้วครับผม

## 3. เปลี่ยน Repository Remote's URL

หลังจากเตรียมความพร้อมเรียบร้อย ก่อนเปลี่ยนให้เราจะมาดูก่อนว่าตอนนี้ Repository ของเราใช้ Remote's URL อะไร (เพื่อเปรียบเทียบ ไม่ต้องทำก็ได้ครับ)

```
➜  blog.kpping.me git:(main) ✗ git remote -v
origin	https://github.com/kpping/blog.kpping.me.git (fetch)
origin	https://github.com/kpping/blog.kpping.me.git (push)

```

จากนั้นให้ใช้คำสั่ง `git remote set-url origin` เพื่อเปลี่ยน

```
➜  blog.kpping.me git:(main) ✗ git remote set-url origin git@github.com:kpping/blog.kpping.me.git
➜  blog.kpping.me git:(main) ✗ git remote -v
origin	git@github.com:kpping/blog.kpping.me.git (fetch)
origin	git@github.com:kpping/blog.kpping.me.git (push)
```

เมื่อเปลี่ยนแล้วให้ทดลองด้วยคำสั่ง `git fetch`

```
➜  blog.kpping.me git:(main) ✗ git fetch
Warning: Permanently added the RSA host key for IP address '52.74.223.119' to the list of known hosts.
```

หากไม่มี Error อะไรแสดงว่าทุกอย่างทำงานได้ถูกต้อง สามารถทำงานต่อได้แล้วครับ 🎉

## ข้อควรระวัง

หาก `/home/kpping/.ssh/github` __หาย__ หรือ __หลุดไปสาธารณะ__ ให้รีบเข้าไป Revoke (Delete) ในบัญชี GitHub ของเรานะครับ เพื่อความปลอดภัยของบัญชีเราครับ

Happy Committing ครับ 😎
