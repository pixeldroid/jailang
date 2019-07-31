// from: https://youtu.be/BwqeFrlSpuI?t=2325

named_bake_test :: (a1: $A, a2: A,  b1: $B, b2: B) -> A,B {
  a_sum := a1 + a2;
  b_product := b1 * b2;

  return a_sum, b_product;
}

nbt :: #bake named_bake_test(A = float, B = int);
// specify the names in any order:
// nbt :: #bake named_bake_test(B = int, A = float);

sum, product := nbt(1, 2, 3, 4); // 3.000000, 12
