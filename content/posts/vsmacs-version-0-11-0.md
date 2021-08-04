---
title: "VSmacs เวอร์ชั่น 0.11.0"
date: 2021-08-04T23:12:22+07:00
draft: false
categories: [geek]
tags: [vscode, emacs, keybindings, vsmacs]
---

Keybindings Emacs ที่ผมเขียนขึ้นมาใช้เองได้เดินทางมาถึงเวอร์ชั่น 0.11.0 แล้ว (เขียนใช้เองมาตั้งแต่ปี ค.ศ. 2017) <!--more-->

โดยในเวอร์ชั่นนี้ได้มีการเปลี่ยนไปใช้ Chain Command ผ่านทาง `args` ใน `*.json` แทน ทำให้การ Maintain Code สะดวกขึ้น

มีการใช้ Event ต่าง ๆ ในการ Start/Stop `Mark Mode` แทน Hard Code ลงไปใน Commands ทำให้แก้ Bugs ไปได้หลายจุด (ดองไว้นานมาก)

ใครอยากใช้ Emacs Move บน VSCode ลองติดตั้งกันได้ครับผม มี Upload ไว้ใน Extensions Marketplace แล้ว

[VSmacs Repo](https://github.com/kpping/vsmacs)

{{< ending-thank-you>}}
Happy Moving ครับ
{{< /ending-thank-you >}}
