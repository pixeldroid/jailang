// from: https://youtu.be/BwqeFrlSpuI?t=2871
//  and: https://youtu.be/7Fsy2WaxLOY?t=109
//  and: https://youtu.be/7Fsy2WaxLOY?t=355

sum :: (a : [] $T) -> $R // note that return type is different from T
#modify ensure_R_is_big_enough
{
  result : R = 0;
  for a result += it;

  return result;
}

fill_and_sum :: (a : [] $T) -> $R
#modify ensure_R_is_big_enough // using same modify proc
{
  for 0..a.count-1 a[it] = cast(it*10, T);

  return sum(a);
}

ensure_R_is_big_enough :: (T : ^Type_Info, R : ^Type_Info) -> ^Type_Info, ^Type_Info {

  if T.type == Type_Info_Tag.FLOAT return T, T; // handle float32 and 64 at their own precisions

  if T.type != Type_Info_Tag.INTEGER {
    printf("#modify proc ensure_R_is_big_enough only takes int or float types.\n");
    return null, null;
  }

  // for integer types, ensure return type won't overflow
  info := cast(T, ^Type_Info_Integer);

  if info.size_in_bits >= 32 return T, T; // big enough

  if info.signed return T, type_info(s32);
  return T, type_info(u32);
}
