// from: https://youtu.be/BwqeFrlSpuI?t=501

swap :: (a: ^$T, b: ^T) {
  tmp := *a;
  *a = *b;
  *b = tmp;
}
