---
title: "ทำ RAID 1 ด้วย mdadm บน Fedora 35"
date: 2022-05-19T14:49:45+07:00
draft: false
categories: [geek]
tags: [linux, raid1, mdadm, fedora]
---

ทดลองเปลี่ยนจาก `zfs` มาใช้ `mdadm` ในการทำ RAID 1 (Mirror) เพื่อเก็บข้อมูล

<!--more-->

1. โดยอันดับแรกหลังจากสำรองข้อมูลขึ้น Cloud เรียบร้อยก็จับ HDD ทั้ง 2 ลูกมา Format ด้วยโปรแกรม `Disks` บน Fedora โดยให้เลือกเป็น `No partitioning (Empty)`

2. ทดสอบว่าไม่มีข้อมูล `md superblock` ใน HDD เรา

```bash
>> sudo mdadm -E /dev/sd[a-b]
mdadm: No md superblock detected on /dev/sda
mdadm: No md superblock detected on /dev/sdb
```

3. ทำการ Partition HDD ทีละลูกด้วยคำสั่ง `fdisk`

```bash
>> sudo fdisk /dev/sda

# Enter following commands
n # create new partition
P # create as Primary
1 # select partition number
[hit enter button] # select default size (first)
[hit enter button] # select default size (last)
t # change partition type
fd # change to Linux raid autodetect
p # print info to check
w # save setting
```

4. ทำการ Partition HDD ลูกที่สอง (ทำเหมือน Step 3)

```bash
>> sudo fdisk /dev/sdb

# repeat command in step 3
```

5. ทดสอบว่าข้อมูลถูกสร้างแล้ว

```bash
>> sudo mdadm -E /dev/sd[a-b]
/dev/sda:
   MBR Magic : aa55
Partition[0] :   1953523120 sectors at         2048 (type fd)
/dev/sdb:
   MBR Magic : aa55
Partition[0] :   1953523120 sectors at         2048 (type fd)
```

6. จากนั้นก็เริ่มสร้าง RAID 1 ได้เลย

```bash
>> sudo mdadm --create /dev/md0 --level=mirror --raid-devices=2 /dev/sd[a-b]1
>> sudo mkfs.ext4 /dev/md0
>> sudo mkdir /mnt/raid1 # change "raid1" to whatever name you like
>> sudo mount /dev/md0 /mnt/raid1/

# append "/dev/md0                /mnt/raid1              ext4    defaults        0 0" to /etc/fstab
>> echo '/dev/md0 /mnt/raid1 ext4 defaults 0 0' | sudo tee -a /etc/fstab

# update mdadm config
>> sudo mdadm --detail --scan --verbose | sudo tee -a /etc/mdadm/mdadm.conf

# check RAID status
>> sudo mdadm --detail /dev/md0
```

7. แก้ Permission ให้ User/Owner group อื่นใช้งานได้ (ไม่ต้อง `sudo`)

```bash
>> sudo chown root:kpping /mnt/raid1 # change "kpping" to your owner group
>> sudo chmod g+rw /mnt/raid1
```

8. อัพเดต `initramfs`

```bash
>> sudo dracut --regenerate-all --force

# reboot system and enjoy
```

[Ref.1](https://www.tecmint.com/create-raid1-in-linux/)
, [Ref.2](https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-18-04)
, [Ref.3](https://www.linux.org/threads/changing-raid-1array-permissions-from-root-to-user.29715/)
