---
layout: directive
title: #must
category: directive
invocation: "`foo :: (x: int) -> bool #must {}`"
description: ensure caller receives return values marked with `#must`

examples:
- { name: must, file: "code/must.jai" }

footnotes:
-
  label: need-for-must
  video: demo_20150310
  time:  3515
  text:  |-
    the problem that comes up is that sometimes you could ignore a return value that you actually really needed to pay attention to.
-
  label: directive-must
  video: demo_20150310
  time:  3568
  text:  |-
    the caller has to receive these values. if the caller does not receive these values, that's an error.
-
  label: dont-abuse-must
  video: demo_20150310
  time:  3805
  text:  |-
    this is not for you to be all anally retentive and put `#must` on every single return value in your api to make sure people check status codes. no. this is for very specific, "you droppped this resource on the floor kind of cases".

---
