---
layout: directive
title: #check_call
category: directive
invocation: "`#check_call <regular_function_name> <checking_function_name>`"
description: run a provided checking function whenever the named function is called

footnotes:
-
  label: directive-check-call
  video: demo_20141031
  time:  2362
  text:  |-
      `#check_call` invokes arbitrary user-provided checking methods at compile time.
-
  label: check-call-arguments
  video: demo_20150211
  time:  2262
  text:  |-
      I can have my arguments be an array of `Any`, and filename, and line number.

---

The checking function should have a signature as follows:

```cpp
checking_function_name :: (
  arguments : [] Any,
  filename : string, line_number : int) -> bool {

  good := true; // replace with arbitrary checks

  if !good {
    printf("details about what was not good\n");
  }

  return good;
}
```

Returning `true` allows execution to continue; `false` halts execution and exits with an error message indicating the file and line where the check returned false.

More specific messages can be printed during the checking function execution.
