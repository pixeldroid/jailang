// from: https://youtu.be/BwqeFrlSpuI?t=2444

internal :: (x: u16) {
  y : $SomeType = x;

  printf("internal: y is %d\n", y);
}

baked := #bake internal(SomeType = u64);
baked (6000);

// won't work to call it directly:
// internal(5);
