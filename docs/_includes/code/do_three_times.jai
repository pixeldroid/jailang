// from: https://youtu.be/BwqeFrlSpuI?t=1200

do_three_times :: (func: ($T) -> void, arg: T) {
  for 1..3 func(arg);
}
