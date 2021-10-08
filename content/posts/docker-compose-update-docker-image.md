---
title: "Docker Compose อัพเดต Container ที่ทำงานอยู่"
date: 2021-10-08T22:21:09+07:00
draft: false
categories: [geek]
tags: [docker, docker-compose, update, image]
---

ทริคเล็ก ๆ สำหรับคนใช้ `docker-compose` เมื่อ docker image ที่เราใช้มีการอัพเดต เราสามารถใช้คำสั่งในตัว `docker-compose` เพื่อ `pull` image ล่าสุดลงมาทั้งชุดได้เลย สะดวกมาก ๆ

```bash
# update images
docker-compose pull

# restart running containers with updated images
docker-compose up -d

# remove unused images
docker image prune
```

