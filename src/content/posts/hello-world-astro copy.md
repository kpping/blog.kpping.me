---
title: "บันทึกทดลองการทำ Vibe Coding (Database Design)"
description: "เลยคิดว่าถึงเวลาแล้วในการพัฒนา New Version ไปเลย เริ่มเขียนใหม่ ตัดส่วนที่ไม่ได้ใช้ออก และอยากลอง Vibe Coding ดู ถ้าสำเร็จ จะประหยัดค่าพัฒนาไปได้มาก"
pubDate: "May 08 2026"
---

จุดเริ่มต้นของงานนี้เกิดจาก Internal Tool ที่เขียนกันไว้เมื่อ 10 ปีก่อนและพยายาม Maintain กันเรื่อยมาเริ่มยากขึ้น จากทั้งบุคลากรเก่าที่ลาออก, ตัว App ที่ Normalize เยอะเกินไปจน Maintain ด้วยคนจำนวนน้อยและใหม่ยาก, แม้จะเขียน Test ไว้ค่อนข้างครอบคลุมแต่ก็ยังเหนื่อยมาก

เลยคิดว่าถึงเวลาแล้วในการพัฒนา New Version ไปเลย เริ่มเขียนใหม่ ตัดส่วนที่ไม่ได้ใช้ออก และอยากลอง Vibe Coding ดู ถ้าสำเร็จ จะประหยัดค่าพัฒนาไปได้มาก

นั่ง Design Spec. ในใจคร่าว ๆ ก็ตัดไปได้เยอะเหมือนกันนี่หว่า 555 (จริง ๆ ต้องบอกว่า Function ที่ Design ไว้เนี่ยมันทำงานได้ปกติ ถ้าใช้งานก็จะมีประโยชน์ แต่ ... User ไม่ใช้ 555)

สิ่งที่ยากในการพัฒนาคือการให้ User ใช้งานนี่แหละครับ เอาไว้มาเขียน Blog เรื่องนี้อีกครั้ง กลับมาที่ Vibe Coding ก่อน

## เริ่ม Vibe Coding

เกริ่นก่อนว่าไม่เคย Vibe Coding เลย เต็มที่คือเป็น Co-pilot ในการช่วย Auto Complete / Scaffolding พวก Repetitive tasks เช่น CRUD, Unit Test เท่านั้น

นี่เป็นครั้งแรกและเริ่มจาก 0 ไม่มี Blue Print ให้ AI เลย

### รอบ 01 Fail (เละเทะ)

เริ่มมาเราก็เปิดเลย ต้องการเขียน Web App ด้วยภาษานี้ ๆ Framework นี้ ๆ แล้วก็เล่าภาพรวมคร่าว ๆ ให้ AI ฟัง จากนั้นมันก็ Generate Database Design มาให้

คร่าว ๆ เฮ้ย ดูดี !! ไม่ต้องพูด Field หรือ Parameter หมด มันก็ใส่มากกว่าที่บอกมาให้ เช่น อะไรที่เกี่ยวกับ Customer ก็แนะนำ Mobile Phone, Social ID, Email. (คิดในใจ ประหยัดเวลาพิมพ์ดี)

จากนั้นเราก็นั่งตรวจ Response. อ้าว Bugs, Flaws กระจุยกระจาย 555

Relation ไม่ครบ. Keys/Indexs มั่วไปหมด. การทำงานขัดกันไปมา อันนึง Single อันนึง Multiple

### รอบ 02 Fail (เหนื่อย)

มานั่งเดา สงสัยให้ข้อมูลน้อยไป เลยระบุแบบ Specific ไปเลยต้องมี Field นี้ ๆ Parameter นี้ ๆ

รอบนี้มัน Generate มาให้ครบละ แต่ เห้ย งี้ก็ไม่ต่างกับเขียนเองแล้ว Co-pilot ช่วยเลย

คิดว่าไม่ได้ ๆ แบบนี้เหนื่อยกว่าเดิมอีก เขียน Code เองยังเร็วกว่า

### รอบ 03 Fail (ดีขึ้น)

รอบนี้จากระบุ Field, Param เปลี่ยนมาเป็นเขียน Use case แทน (ใครนึกไม่ออกว่า Use case เขียนยังไง ให้นึกถึงตอนไปเก็บ Requirement จาก User ครับ)

ระบุการใช้งานจริงไปเลยเช่น User ต้อง Login, User สามารถอยู่ได้สาขาเดียว แต่บาง User มี Autorize ดูข้อมูลสาขาอื่นได้ด้วย อะไรแบบนี้

List เป็น Bullet Point ไปเลย ไม่ต้องเขียนให้สวยหรือสะอาด เน้นกระชับ เร็ว เพราะ AI ไม่บ่นเราเรื่องนี้

สุดท้ายออกมาดีงามมาก แต่ยังมี Bug และ Logic/Reasoning ยังพลาดพอสมควร

เลยทดลองสั่งให้มัน Verify คำตอบตัวเองดู ก็พบ มันก็ฉลาดพอจะหาปัญหาเจอเองนี่หว่า

### รอบ 04 Fail (เกือบละ)

เอาใหม่ คราวนี้ก่อนเริ่ม เรา Set ground rules เช่นได้สั่งให้ AI ตรวจทานคำตอบก่อน Response Answer กลับมา สิ่งที่ต้องตรวจสอบก็เช่น Compatibility, Breaking Change, Relation, Bug, Flaw, Unused Field, etc. ก่อน Update/Merge ต้องให้เรา Approve ก่อน.

จากนั้นก็ป้อน Use case เข้าไป. รอบนี้งานออกมาเกือบเนี้ยบ แต่ยังพบ Bug อยู่บ้าง ต้องสั่งแก้ไขซ้ำ ๆ ซึ่งก็แก้ได้บ้าง แก้ไม่ได้บ้าง ทำให้สงสัยว่าทำไม

เลยลองเปิด Session/Chat ใหม่ดู แล้วก็พบว่ามันทำงานดีขึ้น !!

### รอบ 05 Success (สำเร็จ)

หลังจากทดสอบมาหลายวัน พบว่าสิ่งสำคัญเลยคือชุดคำสั่ง มันต้องสั่งเป็น Step มาก ๆ ห้ามข้าม ห้ามลัด เพราะจะหลอน

Session ต้อง Fresh สดใหม่ ถึงจะทำงานได้ดี การทำงานใน Session เดิม ๆ ก็มีข้อดีในการจดจำ แต่หลายครั้งพบว่ามันหลอน หาข้อมูลใหม่ ๆ ไม่ได้ (เปิด Session ใหม่แล้วถาม อาจจะได้คำตอบใหม่ หรือ หา Bug ใหม่เจอ)

เลยขอสรุปข้อแนะนำคร่าว ๆ ไว้ตรงนี้ เผื่อใครอยากลอง Vibe Coding ครับ

1. ระบุรูปแบบที่ต้องการให้ AI ตอบ / Ground Rule เช่น

   `You are my co programming/developing for web application. Don’t suggest or giving idea unless I asked to reduce token consumption. Before giving me answer about changing/adding/removing code please always verify compatibility, breaking change, bugs, flaws, chaining/relation between each part in entire code. Don’t response full code for me unless I asked to save time.`

2. เล่าสิ่งที่จะทำคร่าว ๆ / Brief Introduction เช่น

   `I am writing internal web application for xxx in Thailand with multi branches. Focused on aaa, bbb, ccc. I prefer to develop in typescript. I’m a one man developer so one man framework is preferable. no 3rd party services.`

3. บอกสิ่งที่มันไม่ต้องคิด / Excluded concern เช่น

   `No VAT concern, all entered price and cost are VAT included.`

4. ระบุ Use case ให้เยอะที่สุด เป็นภาษาพูดก็ได้ (Natural language) ทีละเล็กละน้อย ค่อย ๆ เพิ่มเข้าไป (เราสามารถนำไปต่อยยอดทำ Test Case, Design UI/UX ได้ด้วย) เช่น

   `User need login, login process use email and password`

5. สั่งให้มันทำงานซ้ำ ๆ บ่อย ๆ และระบุคำสั่งให้ชัด อย่ากำกวม ไม่ต้องกลัว AI รำคาญ เช่น

   `test against use case, find bugs (only bug no flaw)`

6. เปิด Fresh session เพื่อสั่งทำงานใหม่ (อาจไม่จำเป็นต้องทุกครั้ง ประเมินจาก Response ล่าสุดของ AI)

เดี๋ยวต่อไปจะลองเริ่ม Implement ดู อาจจะเป็น Text based system ง่าย ๆ ทดสอบด้วย Unit test/Integration test เพื่อดูว่า Vibe Coding ทำได้สุดแค่ไหน

จะมาอัพเดตให้อ่านกันเรื่อย ๆ ครับ
