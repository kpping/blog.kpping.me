---
title: "ทดลองปิดระบบป้องกัน Spectre และ Meltdown Fedora 35 (mitigations=off)"
date: 2021-11-15T12:17:33+07:00
draft: false
categories: [geek]
tags: [linux, fedora, spectre, meltdown, mitigations]
---

**คำเตือน** ไม่แนะนำให้ทำเพราะทำให้ระบบไม่ปลอดภัย เป็นการเปิดช่องทางให้ Hacker โจมตี

สำหรับใครอยากลองเพิ่มความเร็วให้กับคอมพิวเตอร์โดยการปิดระบบป้องกัน Spectre และ Meltdown บน Fedora 35 สามารถทำได้โดยการเพิ่ม `mitigations=off` ลงไปที่ `GRUB_CMDLINE_LINUX` ในไฟล์ `/etc/sysconfig/grub`

<!--more-->

```bash
> sudo emacs -nw /etc/sysconfig/grub

# add here
GRUB_CMDLINE_LINUX="mitigations=off"
```

ทำการ Update ด้วยคำสั่ง `sudo grub2-mkconfig`

```bash
> sudo grub2-mkconfig
```

จากนั้นให้ Reboot เครื่องเป็นอันเสร็จครับ

```bash
> sudo reboot

# check
> grep . /sys/devices/system/cpu/vulnerabilities/*

/sys/devices/system/cpu/vulnerabilities/itlb_multihit:KVM: Mitigation: VMX unsupported
/sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
/sys/devices/system/cpu/vulnerabilities/mds:Not affected
/sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
/sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Vulnerable
/sys/devices/system/cpu/vulnerabilities/spectre_v1:Vulnerable: __user pointer sanitization and usercopy barriers only; no swapgs barriers
/sys/devices/system/cpu/vulnerabilities/spectre_v2:Vulnerable, IBPB: disabled, STIBP: disabled
/sys/devices/system/cpu/vulnerabilities/srbds:Not affected
/sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected
```

ผลการทดสอบสำหรับ `i9-10900KF` ของผมไม่รู้สึกถึงความแตกต่างในการใช้งานทั่วไป และต่างกันไม่มากในการ Compile/Execute Code ครับ (ไม่กี่วินาที) ซึ่งเข้าใจว่ายิ่ง CPU เป็น Gen ใหม่ ๆ จะไม่ค่อยต่าง ([ผลทดสอบตรงกับที่ Blogger ท่านอื่น ๆ เคยทดสอบไว้](https://www.phoronix.com/scan.php?page=article&item=3-years-specmelt&num=1))

## สรุป

สำหรับ `i9-10900KF` ในความคิดเห็นผมคือไม่คุ้มที่จะปิดครับ เพราะแทบไม่รู้สึกในการใช้งานจริง ถ้าจำเป็นต้องใช้จริง ๆ ปิดเป็นกรณี ๆ ไปน่าจะดีที่สุดครับ (ใช้เสร็จก็กลับมาเปิดเหมือนเดิม)

#### ข้อมูลอ้างอิง

[Ref.1](https://unix.stackexchange.com/questions/554908/disable-spectre-and-meltdown-mitigations)
