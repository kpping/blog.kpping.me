---
title: "Firefox บน Fedora 35 เล่นวิดีโอภาพกระตุก"
date: 2022-05-05T12:10:08+07:00
draft: false
categories: [geek]
tags: [linux, fedora, firefox, video, lag, h264]
---

[จากการหาข้อมูลมา](https://www.reddit.com/r/Fedora/comments/k7s9xu/firefox_choppy_video_playback_on_fedora_33_amd_gpu/) สาเหตุเกิดจากด้วยค่า Default Firefox จะใช้ `openh264` decoder จาก Cisco ที่ Performance ต่ำ

ทางแก้คือให้ลง decoder ที่ดีกว่าเช่น `FFMPEG` จาก `rpmfusion.org`

<!--more-->

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install ffmpeg-libs

# restart firefox
```
