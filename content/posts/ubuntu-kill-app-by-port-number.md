---
title: "Ubuntu Kill App by Port Number"
date: 2021-06-08T17:45:56+07:00
draft: false
categories: [geek]
tags: [ubuntu, kill, port]
---

บางครั้งในการพัฒนาโปรแกรมแนว Client-Server เช่นการเขียน Web หรือ API ต่าง ๆ เราจะพบว่า Port ที่เราต้องการใช้ถูกใช้ไปแล้ว เลยอยากจะมาจดไว้หน่อยว่าต้องแก้ไขยังไง เพราะต้องไปค้น Google ทุกที 😅

```
sudo kill -9 $(sudo lsof -t -i:1313)
```
