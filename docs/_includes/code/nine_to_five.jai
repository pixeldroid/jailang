/** from: https://youtu.be/JoNkttD_MUs?t=3248 */

nine_to_five :: (s : ^u8) {
  while *s {
    if *s == '9 then *s = '5;
    s += 1;
  }
}