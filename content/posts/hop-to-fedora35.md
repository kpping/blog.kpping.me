---
title: "เปลี่ยนมาใช้ Fedora 35"
date: 2021-11-15T10:03:07+07:00
draft: false
categories: [geek]
tags: [liunx, distro, hopping, fedora]
---

Ubuntu 21.04 ที่ใช้ตอนนี้กำลังจะ EOL แล้ว เลยทดลองเปลี่ยนมาใช้ Fedora 35 แทน (ไม่ชอบ Upgrade OS ชอบ Clean Install มากกว่า)

<!--more-->

ตอนนี้ยังไม่เจอปัญหาอะไรกวนใจมาก จะมีแค่ [UI บางส่วน](https://www.reddit.com/r/Fedora/comments/qtj8v6/fedora35_has_anyone_run_into_the_this_problem/?utm_source=share&utm_medium=web2x&context=3) ใน `GNOME 41` มีปัญหากับ `X11` แต่ไม่ถึงกับใช้งานไม่ได้

Software ที่ใช้ประจำก็ใช้งานใน Fedora ได้หมด ไม่ต้องใช้ท่าพิเศษอะไรในการลง (ก่อนลง Fedora ไปลอง OpenSUSE แปปนึง แต่สู้ไม่ไหว ไม่มีเวลามากพอ เลยยอมแพ้ 555)

ได้มีโอกาสทดลองใช้ `Podman` แทน `Docker` ในบางโปรเจกต์ ถือว่าสะดวกดี ใช้งานง่าย `API` เหมือนกันเกือบจะหมด

รวม ๆ แล้วถือว่าค่อนข้าง Happy วิธีการใช้งานแทบไม่ต่างจากเดิม ความรู้สึกเหมือนแค่เปลี่ยน `apt` เป็น `dnf` เท่านั้น
