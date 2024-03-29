---
title: "ชนิดคำสั่งซื้อขายต่าง ๆ (Limit, ATO, ATC, MP, MP-MKT, MP-MTL) ในโปรแกรมซื้อขายหุ้น Streaming "
date: 2021-05-25T14:36:53+07:00
draft: false
categories: [ลงทุน]
tags: [หุ้น, streaming, limit, ato, atc, mp, mpmkt, mpmtl]
---

โปรแกรม `Streaming` เป็นโปรแกรมพื้นฐานสำหรับทำการซื้อขายหุ้นด้วยตัวเอง แต่ถึงจะบอกว่าพื้นฐาน ก็ถือว่าเข้าใจยากสำหรับผู้เริ่มใช้งาน (อาจจะเป็นแค่ผมก็ได้ 555) หลาย ๆ บทความก็อ่านแล้วมึน ๆ โดยเฉพาะชนิดคำสั่งซื้อขาย (Order Type) วันนี้ผมเลยจะมาจดสรุปความหมายและวิธีใช้งานในแบบของผมให้อ่านกันครับ

{{< json-figure-picture "/data/posts/limit-ato-atc-mp-mpmkt-mpmtl-ใน-streaming/menu.json" >}}

ในหน้าต่าง `Buy/Sell` ตรงข้าง ๆ ช่อง `Price` จะมีตัวเลือกชนิดคำสั่งซื้อขายอยู่ ซึ่งค่าเริ่มต้นจะเป็น `Limit` เราสามารถกดเพื่อเปลี่ยนชนิดได้

<!--more-->

## Limit

ชนิดคำสั่งซื้อขายแบบ `Limit` จะทำงานคู่กับช่องราคา ( เรากำหนดราคาเอง)

หากเราใส่ราคา 100 บาท ในช่อง `Price` และ เลือกแบบ `Limit` ระบบจะไปตั้งคำสั่งรอซื้อขายที่ราคานั้นให้เรา

คำสั่งจะ Match ถ้า

1. ราคา Bid แถวแรกเท่ากับ 100 บาท (สำหรับการซื้อ) หรือ ราคา Offer แถวแรกเท่ากับ 100 บาท (สำหรับการขาย)
2. เมื่อถึงคิวเรา (บางทีราคาเท่ากับที่เราตั้งไว้แต่ไม่ Match ซักที ก็เพราะระบบยังมาไม่ถึงคิวเราครับ)

หากไม่ Match จนตลาดปิด ระบบจะยกเลิกคำสั่งให้เราโดยอัตโนมัติครับ

## ATO

ชนิดคำสั่งซื้อขายแบบ `ATO` จะใช้งานได้เมื่อตลาดหุ้นเตรียมเปิด (Pre-Open) ในช่วงเช้าและบ่าย

\*คำสั่งนี้เราจะไม่สามารถใส่ราคาได้

หากเลือกซื้อด้วยคำสั่งนี้ในช่วงตลาดหุ้นเตรียมเปิด เมื่อเปิดแล้ว เราจะได้รับหุ้นที่ราคาที่จะมีการซื้อขายสูงสุด (มีการ Match เยอะสุด) หรือ ราคาเปิดนั่นเอง (Project Open)

ในกรณีขายก็เช่นเดียวกัน เราจะขายหุ้นออกไปที่ราคาเปิดครับ

การใช้งาน `ATO` สำหรับผมคือในตอนที่ผมอยากได้หรืออยากซื้อหุ้นตัวนั้นในตอนเปิดตลาด เช่นแย่งซื้อหุ้น IPO ที่มักจะเพิ่มขึ้นเร็วมาก ๆ จนตั้งซื้อไม่ทัน

ในกรณีขายจะเป็นในตอนที่ผมรีบระบายของเพราะกลัวหุ้นจะตกหลังเปิดตลาดครับ

## ATC

ชนิดคำสั่งซื้อขายแบบ `ATC` จะใช้งานได้เมื่อตลาดหุ้นเตรียมปิด (Call Market) ในช่วงเย็นครับ

\*คำสั่งนี้เราจะไม่สามารถใส่ราคาได้

การเลือกซื้อขายด้วยคำสั่งนี้จะคล้าย ๆ กับ `ATO` ครับ แต่เปลี่ยนจากก่อนเปิดเป็นก่อนปิด หรือก็คือเราจะได้หุ้น หรือ ขายหุ้นออกไปที่ราคาปิดของวันครับ

การซื้อที่ `ATC` เหมาะสำหรับการซื้อหุ้นที่ไม่มั่นใจว่าหุ้นจะถูกกว่านี้ได้อีกหรือเปล่าในตอนจบวัน เราก็ตั้ง `ATC` ทิ้งไว้เพื่อให้ซื้อตอนปิดตลาดแทน เผื่อจะได้ราคาถูกกว่านี้

ในกรณีขายจะเป็นในตอนที่คิดว่าราคาปิดจะออกมาสูงกว่าราคาตอนนี้ครับ (เช่นหุ้นที่ก่อนปิดมีการซื้อเยอะ ๆ)

## MP

ชนิดคำสั่งซื้อขายแบบ `MP` เป็นคำสั่งที่จะไปตั้งราคาที่ฝั่งตรงข้ามแถวแรกให้เรา เพื่อที่คำสั่งจะได้ Match ทันที และ หากเกิดจำนวนหุ้น (Volume) ไม่พอ เศษที่เหลือจะไปตั้งที่ราคาในช่องถัดไปเรื่อย ๆ จนครบครับ

\*คำสั่งนี้เราจะไม่สามารถใส่ราคาได้

การขายหุ้นแบบ `MP` เหมาะกับการรีบ Cut Lost ในกรณีที่หุ้นราคาตกเร็วมาก ๆ จนตั้งขายที่ราคาที่ต้องการไม่ทัน

การซื้อหุ้นแบบ `MP` เหมาะกับการแย่งซื้อหุ้นที่คนสนใจพร้อมกันเยอะ ๆ เช่นหุ้น IPO ครับ

### ยกตัวอย่างกรณีที่ 1: ขาย `MP`

หุ้น A มี Bid อยู่ที่

| Bid     | Volume   |
| ------- | -------- |
| 110 บาท | 300 หุ้น |
| 109 บาท | 200 หุ้น |
| 108 บาท | 400 หุ้น |

หากเราส่งคำสั่งขายแบบ `MP` 600 หุ้น เราจะขายหุ้น A ที่ 110 บาท 300 หุ้น, 109 บาท 200 หุ้น, 108 บาท 100 หุ้นครับ

### ยกตัวอย่างกรณีที่ 2: ซื้อ `MP`

หุ้น B มี Offer อยู่ที่

| Offer   | Volume   |
| ------- | -------- |
| 110 บาท | 300 หุ้น |
| 111 บาท | 200 หุ้น |
| 112 บาท | 400 หุ้น |

หากเราส่งคำสั่งซื้อแบบ `MP` 600 หุ้น เราจะซื้อหุ้น B ที่ 110 บาท 300 หุ้น, 111 บาท 200 หุ้น, 112 บาท 100 หุ้นครับ

## MP-MKT

ชนิดคำสั่งซื้อขายแบบ `MP-MKT` จะเหมือนกับ `MP` ยกเว้นหากจำนวนหุ้นไม่ครบจะยกเลิกเศษที่เหลือทิ้งไป

\*คำสั่งนี้เราจะไม่สามารถใส่ราคาได้

จากตารางตัวอย่างข้อ 1 หากส่งคำสั่งขายหุ้น A แบบ `MP-MKT` 600 หุ้น ระบบจะขายหุ้น A ให้เราที่ราคา 110 บาท 300 หุ้น เท่านั้น

ส่วนตัวผมว่าการใช้งานไม่ค่อยมีประโยชน์เท่าไหร่ ยังหาเหตุผลที่จะใช้ไม่เจอครับ

## MP-MTL

ชนิดคำสั่งซื้อขายแบบ `MP-MTL` จะเหมือนกับ `MP` ยกเว้นหากจำนวนหุ้นไม่ครบจะไปตั้งรอทำรายการต่อที่ราคาเดียวกันให้เรา

\*คำสั่งนี้เราจะไม่สามารถใส่ราคาได้

จากตารางตัวอย่างข้อ 1 หากส่งคำสั่งขายหุ้น A แบบ `MP-MKT` 600 หุ้น ระบบจะขายหุ้น A ให้เราที่ราคา 110 บาท 300 หุ้น จากนั้นจะไปตั้งขายรอที่ราคา 110 อีก 300 หุ้นให้เรา

ชนิดคำสั่งนี้ใช้ในเวลาที่ต้องการซื้อขายหุ้นที่ราคา ณ ตอนนี้ ให้ครบตามจำนวนที่อยากได้ ถ้าใช้ชนิดคำสั่งแบบ `Limit` จะต้องเสียเวลามาตั้งใหม่เรื่อย ๆ

&nbsp;

Happy Investing ครับ
