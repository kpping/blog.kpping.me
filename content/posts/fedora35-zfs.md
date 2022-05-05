---
title: "ZFS หลุดบ่อยบน Fedora 35"
date: 2022-05-04T09:57:53+07:00
draft: false
categories: [geek]
tags: [liunx, zfs, fedora]
---

ข้อดีและข้อเสียอย่างนึงของ Fedora ก็คือมัน Update บ่อย 555 😂 เราได้ใช้ของใหม่ตลอดก็จริง แต่ของเก่าที่พัฒนาตามไม่ทัน หรือ เงื่อนไขการเรียกใช้ที่ผูกอยู่กับเวอร์ชั่นของ Distro/Linux Kernel นั้น ๆ จะทำให้โหลดไม่ขึ้นหรือเลวร้ายสุดคือพังไปเลย

อย่างกรณีของ ZFS (ณ วันนี้ Linux Kernel 5.17.5-200) จะเป็นโหลดไม่ขึ้น (ทุกอย่างยังอยู่ครบแค่ไม่พบ Module ที่ตรงกับเวอร์ชั่นที่ Support)

ทีนี้เราจะแก้ไขได้ยังไง ในเมื่อมันยังไม่ Support ? คำตอบคือต้องลอง Build เองครับ

<!--more-->

```bash
# install required libs
sudo dnf install --skip-broken epel-release gcc make autoconf automake libtool rpm-build libtirpc-devel libblkid-devel libuuid-devel libudev-devel openssl-devel zlib-devel libaio-devel libattr-devel elfutils-libelf-devel kernel-devel-$(uname -r) python3 python3-devel python3-setuptools python3-cffi libffi-devel git ncompress libcurl-devel
sudo dnf install --skip-broken --enablerepo=epel --enablerepo=powertools python3-packaging dkms

# get latest zfs released (as of 2022-05-04)
wget https://github.com/openzfs/zfs/releases/download/zfs-2.1.4/zfs-2.1.4.tar.gz

# extract and try
tar xf zfs-2.1.4.tar.gz
cd zfs-2.1.4
./configure
make
sudo make install

# looking good ?, load it
sudo modprobe -v zfs
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/spl/spl.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/nvpair/znvpair.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/zcommon/zcommon.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/icp/icp.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/avl/zavl.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/lua/zlua.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/zstd/zzstd.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/unicode/zunicode.ko
# insmod /lib/modules/5.17.5-200.fc35.x86_64/extra/zfs/zfs.ko

# check
which zfs
# /usr/local/sbin/zfs
zfs --version
# zfs-2.1.4-1
# zfs-kmod-2.1.4-1

# import lost pool (depend on your name, in my case it is "tank")
sudo zpool import
sudo zpool import tank
```
