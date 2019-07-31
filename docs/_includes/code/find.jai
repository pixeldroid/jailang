// from: https://youtu.be/BwqeFrlSpuI?t=868

find :: (array: [] $T, item: T) -> s64 {
  for array if it == item return it_index;
  return -1; // (not found)
}
