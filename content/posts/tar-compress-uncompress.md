---
title: "Tar Compress & Uncompress"
date: 2021-09-27T16:41:47+07:00
draft: false
categories: [geek]
tags: [tar, gz, compress, uncompress]
---

ชอบลืมทุกครั้งว่าคำสั่ง compress กับ uncompress ด้วย tar คืออะไร เลยมาขอจดไว้ในบล็อกนี้ให้หาง่าย ๆ หน่อย

```bash
# compress
tar -czvf foo.tar.gz /path/to/foo

# uncompress
tar -xf foo.tar.gz
```
